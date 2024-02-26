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
  static const List<ItemStock> _stock = [
    ItemStock.high,
    ItemStock.medium,
    ItemStock.low,
  ];

  @override
  initState() {
    super.initState();
    getData();
  }

  getData() async {
    penStock = await getInventory(VendorType.pen);
    pencilStock = await getInventory(VendorType.pencil);
    booksStock = await getInventory(VendorType.books);
    setState(() {});
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
    if (savingStatus != 'Saved') {
      return const Saving();
    }
    if (penStock == null || pencilStock == null || booksStock == null) {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Pen Stock',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                const SizedBox(width: 60),
                DropdownButton<ItemStock>(
                  value: penStock,
                  onChanged: (ItemStock? newValue) {
                    setState(() {
                      penStock = newValue ?? penStock;
                    });
                  },
                  items: _stock
                      .map<DropdownMenuItem<ItemStock>>((ItemStock value) {
                    return DropdownMenuItem<ItemStock>(
                      value: value,
                      child: Text(value.text),
                    );
                  }).toList(),
                  borderRadius: BorderRadius.circular(10),
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Pencil Stock',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                const SizedBox(width: 60),
                DropdownButton<ItemStock>(
                  value: pencilStock,
                  onChanged: (ItemStock? newValue) {
                    setState(() {
                      pencilStock = newValue ?? pencilStock;
                    });
                  },
                  items: _stock
                      .map<DropdownMenuItem<ItemStock>>((ItemStock value) {
                    return DropdownMenuItem<ItemStock>(
                      value: value,
                      child: Text(value.text),
                    );
                  }).toList(),
                  borderRadius: BorderRadius.circular(10),
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Books Stock',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
                const SizedBox(width: 60),
                DropdownButton<ItemStock>(
                  value: booksStock,
                  onChanged: (ItemStock? newValue) {
                    setState(() {
                      booksStock = newValue ?? booksStock;
                    });
                  },
                  items: _stock
                      .map<DropdownMenuItem<ItemStock>>((ItemStock value) {
                    return DropdownMenuItem<ItemStock>(
                      value: value,
                      child: Text(value.text),
                    );
                  }).toList(),
                  borderRadius: BorderRadius.circular(10),
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            CustomButton(text: 'Save', onPressed: setData, size: size),
          ],
        ),
      ),
    );
  }
}
