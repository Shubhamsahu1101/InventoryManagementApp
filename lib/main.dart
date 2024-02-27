import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stationery/landing_screen.dart';
import 'package:stationery/models/vendor_type.dart';
import 'package:stationery/repositories/auth_repository.dart';
import 'package:stationery/stationery/inventory_screen_stationery.dart';
import 'package:stationery/vendor/inventory_screen_vendor.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth auth = FirebaseAuth.instance;
  if (auth.currentUser == null) {
    // User is not logged in
    runApp(
      const MaterialApp(
        home: LandingScreen(),
      ),
    );
  } else {
    // User is logged in
    String userType = await getUserFromFirebase();
    if (userType == 'Store') {
      runApp(
        const MaterialApp(
          home: InventoryScreenStationery(),
        ),
      );
    } else if (userType == 'Pen Vendor') {
      runApp(
        const MaterialApp(
          home: InventoryScreenVendor(vendorType: VendorType.pen),
        ),
      );
    } else if (userType == 'Pencil Vendor') {
      runApp(
        const MaterialApp(
          home: InventoryScreenVendor(vendorType: VendorType.pencil),
        ),
      );
    } else if (userType == 'Books Vendor') {
      runApp(
        const MaterialApp(
          home: InventoryScreenVendor(vendorType: VendorType.books),
        ),
      );
    } else {
      runApp(
        const MaterialApp(
          home: LandingScreen(),
        ),
      );
    }
  }
}
