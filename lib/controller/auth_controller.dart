import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/signupPage.dart';
import 'package:flutter_application_1/page/homePage.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<User?> _user;

  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.authStateChanges());
    ever(_user, loginRedirect);
  }

  loginRedirect(User? user) {
    if (user == null) {
      Get.offAll(SignUpPage());
    } else {
      Get.offAll(HomePage());
    }
  }

  void registerUser(email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
      geterrorMessage("Account not founded", e);

      // Get.snackbar("error", "Message");
    }
  }

  geterrorMessage(String message, eroor) {
    Get.snackbar("Error", "$message\n ${eroor.message}",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        borderRadius: 10);
  }

  void signOut() async {
    await auth.signOut();
  }

  void login(email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
      geterrorMessage("Account not founded", e);

      // Get.snackbar("error", "Message");
    }
  }

  void forgotPassword(email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      Get.snackbar("Error", "Reset mail sent successfully");
    } on FirebaseAuthException catch (e) {}
  }
}
