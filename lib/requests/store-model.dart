class StoreData {
  StoreData(this.storeName, this.storeAddress, this.items);
  final String storeName;
  final String storeAddress;
  final List<ItemData> items;
}

class ItemData {
  ItemData(this.ingredient, this.name, this.price, this.sale, this.amount, this.ingredientType);
  final String ingredient;
  final String name;
  final String price;
  final String sale;
  final String ingredientType;
  int amount;
}