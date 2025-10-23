"""数据项路由"""
from typing import List
from fastapi import APIRouter, HTTPException
from pydantic import BaseModel

router = APIRouter()


class Item(BaseModel):
    """数据项模型"""
    id: int
    name: str
    description: str | None = None
    price: float
    tax: float | None = None


# 模拟数据库
items_db: List[Item] = [
    Item(id=1, name="商品 1", description="这是商品 1", price=100.0, tax=10.0),
    Item(id=2, name="商品 2", description="这是商品 2", price=200.0, tax=20.0),
]


@router.get("/items", response_model=List[Item])
async def get_items():
    """获取所有数据项"""
    return items_db


@router.get("/items/{item_id}", response_model=Item)
async def get_item(item_id: int):
    """获取单个数据项"""
    for item in items_db:
        if item.id == item_id:
            return item
    raise HTTPException(status_code=404, detail="数据项不存在")


@router.post("/items", response_model=Item, status_code=201)
async def create_item(item: Item):
    """创建数据项"""
    items_db.append(item)
    return item


@router.put("/items/{item_id}", response_model=Item)
async def update_item(item_id: int, item: Item):
    """更新数据项"""
    for idx, existing_item in enumerate(items_db):
        if existing_item.id == item_id:
            items_db[idx] = item
            return item
    raise HTTPException(status_code=404, detail="数据项不存在")


@router.delete("/items/{item_id}")
async def delete_item(item_id: int):
    """删除数据项"""
    for idx, item in enumerate(items_db):
        if item.id == item_id:
            items_db.pop(idx)
            return {"message": "删除成功"}
    raise HTTPException(status_code=404, detail="数据项不存在")
