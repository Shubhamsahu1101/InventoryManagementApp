import 'package:flutter/material.dart';
import 'package:stationery/inventory_repository.dart';
import 'package:stationery/models/vendor_type.dart';
import 'package:stationery/utils/colors.dart';

class InventoryScreenVendor extends StatefulWidget {
  final VendorType vendorType;
  const InventoryScreenVendor({super.key, required this.vendorType});

  @override
  State<InventoryScreenVendor> createState() => _InventoryScreenVendorState();
}

class _InventoryScreenVendorState extends State<InventoryScreenVendor> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height / 12,
        backgroundColor: appBarColor,
        surfaceTintColor: appBarColor,
        title: const Text(
          'Inventory',
          style: TextStyle(
            fontSize: 30,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${widget.vendorType.text} Stock',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(width: 60),
            StreamBuilder(
              stream: getInventoryStream(widget.vendorType),
              builder: (context, snapshot) {
                String itemStock = 'No Data Found';
                if (snapshot.hasData) {
                  itemStock = snapshot.data!;
                }
                return Text(
                  itemStock,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
