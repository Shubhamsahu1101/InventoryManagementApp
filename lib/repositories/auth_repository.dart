import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:stationery/landing_screen.dart';
import 'package:stationery/models/vendor_type.dart';
import 'package:stationery/stationery/inventory_screen_stationery.dart';
import 'package:stationery/utils/utils.dart';
import 'package:stationery/vendor/inventory_screen_vendor.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;

void createUserWithEmailAndPassword(BuildContext context, String emailAddress,
    String password, String userType) async {
  try {
    final credential = await auth.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );

    if (credential.user != null) {
      if (context.mounted) {
        showSnackBar(context: context, content: 'User created successfully');
      }
    }
    if (context.mounted) {
      await saveUserDataToFirebase(context: context, userType: userType);
    }
    if (context.mounted) {
      finishLogin(context, userType);
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      if (context.mounted) {
        showAlertDialog(
            context: context, content: 'The password provided is too weak.');
      }
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      if (context.mounted) {
        showAlertDialog(
            context: context,
            content: 'The account already exists for that email.');
      }
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
}

void signInWithEmailAndPassword(BuildContext context, String emailAddress,
    String password, String userType) async {
  try {
    final credential = await auth.signInWithEmailAndPassword(
        email: emailAddress, password: password);
    if (credential.user != null) {
      String loginUserType = 'User Not Found';
      loginUserType = await getUserFromFirebase();
      if (loginUserType != userType) {
        if (context.mounted) {
          showAlertDialog(
              context: context, content: 'You are not authorized as a $userType');
          await auth.signOut();
        }
        return;
      }
      if (context.mounted) {
        showSnackBar(context: context, content: 'User signed in successfully');
        finishLogin(context, loginUserType);
      }
    }
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      if (context.mounted) {
        showAlertDialog(
            context: context, content: 'No user found for that email.');
      }
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      if (context.mounted) {
        showAlertDialog(
            context: context,
            content: 'Wrong password provided for that user.');
      }
      print('Wrong password provided for that user.');
    } else {
      if (context.mounted) {
        showAlertDialog(
            context: context,
            content: 'Please check your Username or Password.');
      }
    }
  }
}

Future<void> saveUserDataToFirebase({
  required BuildContext context,
  required String userType,
}) async {
  try {
    String uid = auth.currentUser!.uid;
    await firestore.collection('users').doc(uid).set({'type': userType});
  } catch (e) {
    if (context.mounted) {
      showSnackBar(context: context, content: e.toString());
    }
  }
}

Future<String> getUserFromFirebase() async {
  String uid = auth.currentUser!.uid;
  DocumentSnapshot snapshot =
      await firestore.collection('users').doc(uid).get();
  if (snapshot.exists) {
    return snapshot['type'];
  }
  return 'User Not Found';
}

void logOut(BuildContext context) async {
  try {
    await auth.signOut();
    if (context.mounted) {
      showSnackBar(context: context, content: 'User logged out successfully');
      pushAndRemoveUntil(context: context, screen: () => const LandingScreen());
    }
  } catch (e) {
    if (context.mounted) {
      showSnackBar(context: context, content: e.toString());
    }
  }
}

void finishLogin(BuildContext context, String userType) {
  if (userType == 'User Not Found') {
    if (context.mounted) {
      showSnackBar(context: context, content: 'User not found');
    }
    return;
  }
  if (context.mounted) {
    pushAndRemoveUntil(
      context: context,
      screen: () => userType == 'Store'
          ? const InventoryScreenStationery()
          : userType == 'Pen Vendor'
              ? const InventoryScreenVendor(vendorType: VendorType.pen)
              : userType == 'Pencil Vendor'
                  ? const InventoryScreenVendor(vendorType: VendorType.pencil)
                  : const InventoryScreenVendor(vendorType: VendorType.books),
    );
  }
}
