enum ItemStock {
  high,
  medium,
  low,
}

extension ItemStockExtension on ItemStock {
  String get text {
    switch (this) {
      case ItemStock.high:
        return 'High';
      case ItemStock.medium:
        return 'Medium';
      case ItemStock.low:
        return 'Low';
    }
  }
}
