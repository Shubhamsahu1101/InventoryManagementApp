import 'package:flutter/material.dart';
import 'package:stationery/stationery/login_screen_stationery.dart';
import 'package:stationery/utils/colors.dart';
import 'package:stationery/utils/custom_button.dart';
import 'package:stationery/utils/utils.dart';
import 'package:stationery/vendor/login_screen_vendor.dart';
import 'package:stationery/models/vendor_type.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

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
          'Stationery Management',
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
                screen: () => LoginPageStationery(stationeryName: 'Subhash'),
              ),
              size: size,
            ),
            SizedBox(height: size.height / 40),
            CustomButton(
              text: 'Pen Vendor',
              onPressed: () => push(
                context: context,
                screen: () => LoginPageVendor(vendorType: VendorType.pen),
              ),
              size: size,
            ),
            SizedBox(height: size.height / 40),
            CustomButton(
              text: 'Pencil Vendor',
              onPressed: () => push(
                context: context,
                screen: () => LoginPageVendor(vendorType: VendorType.pencil),
              ),
              size: size,
            ),
            SizedBox(height: size.height / 40),
            CustomButton(
              text: 'Books Vendor',
              onPressed: () => push(
                context: context,
                screen: () => LoginPageVendor(vendorType: VendorType.books),
              ),
              size: size,
            ),
          ],
        ),
      ),
    );
  }
}
