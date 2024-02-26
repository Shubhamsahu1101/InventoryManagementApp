import 'package:flutter/material.dart';
import 'package:stationery/models/item_stock.dart';
import 'package:stationery/models/vendor_type.dart';
import 'package:stationery/utils/colors.dart';

class CustomDropDownMenu extends StatefulWidget {
  final VendorType vendorType;
  final Function(ItemStock? newValue) onChange;
  const CustomDropDownMenu(
      {super.key, required this.onChange, required this.vendorType});
  static const List<ItemStock> _stock = [
    ItemStock.high,
    ItemStock.medium,
    ItemStock.low,
  ];

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  ItemStock? currentValue;
  @override
  Widget build(BuildContext context) {
    return Row(
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
        DropdownButton<ItemStock>(
          value: currentValue,
          onChanged: (ItemStock? newValue) {
            widget.onChange(newValue);
            setState(() {
              currentValue = newValue ?? currentValue;
            });
          },
          items: CustomDropDownMenu._stock
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
    );
  }
}
