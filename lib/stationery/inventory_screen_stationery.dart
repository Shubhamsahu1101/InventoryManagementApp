import 'package:flutter/material.dart';
import 'package:stationery/inventory_repository.dart';
import 'package:stationery/models/item_stock.dart';
import 'package:stationery/models/vendor_type.dart';
import 'package:stationery/utils/colors.dart';
import 'package:stationery/utils/custom_button.dart';
import 'package:stationery/utils/custom_dropdownmenu.dart';
import 'package:stationery/utils/loading.dart';
import 'package:stationery/utils/saving.dart';

class InventoryScreenStationery extends StatefulWidget {
  const InventoryScreenStationery({super.key});

  @override
  State<InventoryScreenStationery> createState() =>
      InventoryScreenStationeryState();
}

class InventoryScreenStationeryState extends State<InventoryScreenStationery> {
  ItemStock? penStock;
  ItemStock? pencilStock;
  ItemStock? booksStock;
  String savingStatus = 'Saved';

  @override
  initState() {
    super.initState();
    getData();
  }

  getData() async {
    penStock = await getInventory(VendorType.pen);
    pencilStock = await getInventory(VendorType.pencil);
    booksStock = await getInventory(VendorType.books);
    setState((){});
  }

  void onChangePen(ItemStock? newValue) async {
    setState(() {
      penStock = newValue!;
    });
  }

  void onChangePencil(ItemStock? newValue) {
    setState(() {
      pencilStock = newValue!;
    });
  }

  void onChangeBooks(ItemStock? newValue) {
    setState(() {
      booksStock = newValue!;
    });
  }

  void setData() async {
    setState(() {
      savingStatus = 'Saving';
    });
    await setInventory(VendorType.pen, penStock!);
    await setInventory(VendorType.pencil, pencilStock!);
    await setInventory(VendorType.books, booksStock!);
    setState(() {
      savingStatus = 'Saved';
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if(savingStatus != 'Saved'){
      return const Saving();
    }
    if(penStock == null || pencilStock == null || booksStock == null) {
      return const Loading();
    }
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
        child: Column(
          children: [
            const SizedBox(height: 80),
            CustomDropDownMenu(
                onChange: onChangePen, vendorType: VendorType.pen),
            const SizedBox(height: 40),
            CustomDropDownMenu(
                onChange: onChangePencil, vendorType: VendorType.pencil),
            const SizedBox(height: 40),
            CustomDropDownMenu(
                onChange: onChangeBooks, vendorType: VendorType.books),
            const SizedBox(height: 40),
            CustomButton(text: 'Save', onPressed: setData, size: size),
          ],
        ),
      ),
    );
  }
}
