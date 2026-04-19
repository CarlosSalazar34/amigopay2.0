from sqlalchemy import Column, Integer, String, Float, ForeignKey
from sqlalchemy.orm import relationship
from database import Base
from pydantic import BaseModel, EmailStr
from typing import Optional

# --- SQLAlchemy Models ---

class DBUser(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True)
    nombre = Column(String, index=True)
    email = Column(String, unique=True, index=True)
    # password could be added later for real security

class DBTransaction(Base):
    __tablename__ = "transactions"

    id = Column(Integer, primary_key=True, index=True)
    titulo = Column(String, index=True)
    monto = Column(Float)
    tipo = Column(String)  # 'ingreso' or 'gasto'

class DBNotification(Base):
    __tablename__ = "notifications"

    id = Column(Integer, primary_key=True, index=True)
    titulo = Column(String)
    mensaje = Column(String)
    leido = Column(Integer, default=0) # 0 for false, 1 for true

# --- Pydantic Schemas ---

class TransactionBase(BaseModel):
    titulo: str
    monto: float
    tipo: str

class TransactionCreate(TransactionBase):
    pass

class TransactionSchema(TransactionBase):
    id: int

    class Config:
        from_attributes = True

class UserBase(BaseModel):
    nombre: str
    email: str

class UserCreate(UserBase):
    pass

class UserSchema(UserBase):
    id: int

    class Config:
        from_attributes = True

class NotificationSchema(BaseModel):
    id: int
    titulo: str
    mensaje: str
    leido: int

    class Config:
        from_attributes = True

class NotificationUpdate(BaseModel):
    leido: int
