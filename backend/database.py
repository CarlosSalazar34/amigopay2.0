import os
from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

# Database Connection
# Using Railway PostgreSQL as the ONLY database (as requested by user)
DATABASE_URL = "postgresql://postgres:KChSdJKxsnIJUtEkiiXGKYnHPRFdFLQP@roundhouse.proxy.rlwy.net:26362/railway"

# Ensure SQLAlchemy uses correct prefix
if DATABASE_URL.startswith("postgres://"):
    DATABASE_URL = DATABASE_URL.replace("postgres://", "postgresql://", 1)

engine = create_engine(DATABASE_URL)

SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

Base = declarative_base()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
