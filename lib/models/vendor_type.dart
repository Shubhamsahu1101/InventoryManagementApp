enum VendorType {
  pen,
  pencil,
  books,
}

extension VendorTypeExtension on VendorType {
  String get text {
    switch (this) {
      case VendorType.pen:
        return 'Pen';
      case VendorType.pencil:
        return 'Pencil';
      case VendorType.books:
        return 'Books';
    }
  }
}
