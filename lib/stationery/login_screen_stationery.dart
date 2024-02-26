import 'package:flutter/material.dart';
import 'package:stationery/stationery/inventory_screen_stationery.dart';
import 'package:stationery/utils/colors.dart';
import 'package:stationery/utils/custom_button.dart';
import 'package:stationery/utils/utils.dart';

class LoginPageStationery extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final String stationeryName;
  LoginPageStationery({super.key, required this.stationeryName});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: size.height / 12,
        backgroundColor: appBarColor,
        surfaceTintColor: appBarColor,
        title: const Text(
          'Store Login',
          style: TextStyle(
            fontSize: 30,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: size.height / 18),
            Text(
              '$stationeryName Stationery',
              style: const TextStyle(
                  fontSize: 32, color: textColor, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height / 30),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: appBarColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                fillColor: Colors.grey.shade100,
                filled: true,
              ),
            ),
            SizedBox(height: size.height / 80),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: appBarColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                fillColor: Colors.grey.shade100,
                filled: true,
              ),
            ),
            SizedBox(height: size.height / 80),
            CustomButton(
              text: 'Login',
              onPressed: () {
                push(
                    context: context,
                    screen: () => const InventoryScreenStationery());
              },
              size: size,
            ),
          ],
        ),
      ),
    );
  }
}
