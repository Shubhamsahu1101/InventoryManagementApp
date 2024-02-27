import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stationery/models/item_stock.dart';
import 'package:stationery/models/vendor_type.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;

setInventory(VendorType vendorType, ItemStock currentStock) async {
  await firestore
      .collection('inventory')
      .doc(vendorType.text)
      .set({vendorType.text: currentStock.text});
}

Stream<String> getInventoryStream(VendorType vendorType) {
  return firestore
      .collection('inventory')
      .doc(vendorType.text)
      .snapshots()
      .map((event) => event.data()![vendorType.text]);
}

Future<ItemStock> getInventory(VendorType vendorType) async {
  DocumentSnapshot snapshot =
      await firestore.collection('inventory').doc(vendorType.text).get();

  if (snapshot.exists) {
    String stockText = snapshot[vendorType.text];
    switch (stockText) {
      case 'High':
        return ItemStock.high;
      case 'Medium':
        return ItemStock.medium;
      case 'Low':
        return ItemStock.low;
      default:
        throw Exception('Invalid stock text: $stockText');
    }
  } else {
    throw Exception('Document not found for vendor type: ${vendorType.text}');
  }
}