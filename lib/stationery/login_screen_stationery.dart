import 'package:flutter/material.dart';
import 'package:stationery/register_user_screen.dart';
import 'package:stationery/repositories/auth_repository.dart';
import 'package:stationery/utils/colors.dart';
import 'package:stationery/utils/custom_button.dart';
import 'package:stationery/utils/utils.dart';

class LoginScreenStationery extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final String stationeryName;
  LoginScreenStationery({super.key, required this.stationeryName});

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
                signInWithEmailAndPassword(context, emailController.text,
                    passwordController.text, 'Store');
              },
              size: size,
            ),
            SizedBox(height: size.height / 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account? ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textColor,
                    fontSize: 18,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    push(
                      context: context,
                      screen: () => RegisterUserScreen(
                        userType: 'Store',
                      ),
                    );
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
