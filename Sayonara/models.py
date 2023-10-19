from sqlalchemy import create_engine, Column, Integer, String, ForeignKey, Float
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship

Base = declarative_base()

class Consumer(Base):
    __tablename__ = 'consumers'
    id = Column(Integer, primary_key=True)
    name = Column(String)
    email = Column(String)

class Product(Base):
    __tablename__ = 'products'
    id = Column(Integer, primary_key=True)
    name = Column(String)
    price = Column(Float)

# class Sale(Base):
#     __tablename__ = 'sales'
#     id = Column(Integer, primary_key=True)
#     consumer_id = Column(Integer, ForeignKey('consumers.id'))
#     product_id = Column(Integer, ForeignKey('products.id'))
#     quantity = Column(Integer)
#     consumer = relationship('Consumer')
#     product = relationship('Product')
