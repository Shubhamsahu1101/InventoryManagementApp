import 'package:flutter/material.dart';
import 'package:stationery/stationery/login_screen_stationery.dart';
import 'package:stationery/utils/colors.dart';
import 'package:stationery/utils/custom_button.dart';
import 'package:stationery/utils/utils.dart';
import 'package:stationery/models/vendor_type.dart';
import 'package:stationery/vendor/login_screen_vendor.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height / 12,
        backgroundColor: appBarColor,
        surfaceTintColor: appBarColor,
        centerTitle: true,
        title: const Text(
          'Inventory Management',
          style: TextStyle(
            fontSize: 30,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              text: 'Subhash Stationery',
              onPressed: () => push(
                context: context,
                screen: () => LoginScreenStationery(stationeryName: 'Subhash'),
              ),
              size: size,
            ),
            SizedBox(height: size.height / 40),
            CustomButton(
              text: 'Pen Vendor',
              onPressed: () => push(
                context: context,
                screen: () => LoginScreenVendor(vendorType: VendorType.pen),
              ),
              size: size,
            ),
            SizedBox(height: size.height / 40),
            CustomButton(
              text: 'Pencil Vendor',
              onPressed: () => push(
                context: context,
                screen: () => LoginScreenVendor(vendorType: VendorType.pencil),
              ),
              size: size,
            ),
            SizedBox(height: size.height / 40),
            CustomButton(
              text: 'Books Vendor',
              onPressed: () => push(
                context: context,
                screen: () => LoginScreenVendor(vendorType: VendorType.books),
              ),
              size: size,
            ),
          ],
        ),
      ),
    );
  }
}
