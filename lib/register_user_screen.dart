import 'package:flutter/material.dart';
import 'package:stationery/repositories/auth_repository.dart';
import 'package:stationery/utils/colors.dart';
import 'package:stationery/utils/custom_button.dart';

class RegisterUserScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final String userType;
  RegisterUserScreen({super.key, required this.userType});

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
          'Register User',
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
              text: 'Register',
              onPressed: () {
                createUserWithEmailAndPassword(context, emailController.text,
                    passwordController.text, userType);
              },
              size: size,
            ),
          ],
        ),
      ),
    );
  }
}
