import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputValidation {
  static bool validateFeild(String title, String value) {
    if (value.trim().isNotEmpty) {
      return true;
    } else {
      Get.snackbar("Error", "$title is empty",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange,
          borderRadius: 10);
      return false;
    }
  }

  static bool validatePasswords(String value1, String value2) {
    if (value1.trim() == value2.trim()) {
      return true;
    } else {
      Get.snackbar("Error", "Confirm Password dont match",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          borderRadius: 10);
      return false;
    }
  }
}
