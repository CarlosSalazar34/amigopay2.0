from fastapi import FastAPI, Depends, HTTPException, status
from fastapi.middleware.cors import CORSMiddleware
from sqlalchemy.orm import Session
from typing import List

import models, database

# Fix schema: NUCLEAR OPTION (Drop and recreate once to ensure columns exist)
# Only run this if we detect the missing column, otherwise it's destructive.
from sqlalchemy import inspect
inspector = inspect(database.engine)
tables = inspector.get_table_names()
if 'transactions' in tables:
    columns = [c['name'] for c in inspector.get_columns('transactions')]
    if 'user_id' not in columns:
        print("Schema mismatch detected. Recreating database...")
        models.Base.metadata.drop_all(bind=database.engine)

models.Base.metadata.create_all(bind=database.engine)

app = FastAPI(title="AmigoPay API")

# Add CORS middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# --- Transactions Endpoints ---

@app.get("/")
async def root():
    return {"message": "funcionando ✅"}

@app.get("/transactions", response_model=List[models.TransactionSchema])
def get_transactions(user_id: int, db: Session = Depends(database.get_db)):
    return db.query(models.DBTransaction).filter(models.DBTransaction.user_id == user_id).all()

@app.post("/transactions", response_model=models.TransactionSchema)
def create_transaction(transaction: models.TransactionCreate, db: Session = Depends(database.get_db)):
    db_transaction = models.DBTransaction(**transaction.model_dump())
    db.add(db_transaction)
    
    # Auto-generate notification
    notif_title = "Nuevo Ingreso" if transaction.tipo == "ingreso" else "Nuevo Gasto"
    notif_msg = f"Has registrado un {transaction.tipo} de ${transaction.monto} por: {transaction.titulo}"
    db_notif = models.DBNotification(
        titulo=notif_title, 
        mensaje=notif_msg,
        user_id=transaction.user_id
    )
    db.add(db_notif)
    
    db.commit()
    db.refresh(db_transaction)
    return db_transaction

@app.get("/notifications", response_model=List[models.NotificationSchema])
def get_notifications(user_id: int, db: Session = Depends(database.get_db)):
    return db.query(models.DBNotification).filter(models.DBNotification.user_id == user_id).order_by(models.DBNotification.id.desc()).all()

@app.patch("/notifications/{notif_id}", response_model=models.NotificationSchema)
def update_notification(notif_id: int, update: models.NotificationUpdate, db: Session = Depends(database.get_db)):
    db_notif = db.query(models.DBNotification).filter(models.DBNotification.id == notif_id).first()
    if not db_notif:
        raise HTTPException(status_code=404, detail="Notification not found")
    db_notif.leido = update.leido
    db.commit()
    db.refresh(db_notif)
    return db_notif

@app.get("/balance")
def get_balance(user_id: int, db: Session = Depends(database.get_db)):
    transactions = db.query(models.DBTransaction).filter(models.DBTransaction.user_id == user_id).all()
    balance = sum(t.monto if t.tipo == 'ingreso' else -t.monto for t in transactions)
    return {"balance": balance}

# --- User Endpoints ---

@app.post("/users", response_model=models.UserSchema)
def create_user(user: models.UserCreate, db: Session = Depends(database.get_db)):
    existing_user = db.query(models.DBUser).filter(models.DBUser.email == user.email).first()
    if existing_user:
        return existing_user
    db_user = models.DBUser(**user.model_dump())
    db.add(db_user)
    db.commit()
    db.refresh(db_user)
    return db_user

@app.delete("/users/{user_id}")
def delete_user(user_id: int, db: Session = Depends(database.get_db)):
    # Delete associated transactions
    db.query(models.DBTransaction).filter(models.DBTransaction.user_id == user_id).delete()
    # Delete associated notifications
    db.query(models.DBNotification).filter(models.DBNotification.user_id == user_id).delete()
    # Delete the user
    user = db.query(models.DBUser).filter(models.DBUser.id == user_id).first()
    if not user:
        raise HTTPException(status_code=404, detail="User not found")
    db.delete(user)
    db.commit()
    return {"message": "Usuario eliminado correctamente"}
