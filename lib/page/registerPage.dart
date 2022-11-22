import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/controller/auth_controller.dart';
import 'package:flutter_application_1/controller/input%20validation.dart';
import 'package:flutter_application_1/page/signupPage.dart';
import 'package:get/get.dart';

class RegisterPage extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final conformpassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(22),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 15,
          ),
          Center(child: Text("Create a new account")),
          SizedBox(
            height: 15,
          ),
          TextField(
              controller: nameController,
              decoration: InputDecoration(
                  hintText: "Name", border: OutlineInputBorder())),
          SizedBox(
            height: 15,
          ),
          TextField(
              controller: emailController,
              decoration: InputDecoration(
                  hintText: "Email", border: OutlineInputBorder())),
          SizedBox(
            height: 15,
          ),
          TextField(
              controller: passController,
              decoration: InputDecoration(
                  hintText: "Password", border: OutlineInputBorder())),
          SizedBox(
            height: 15,
          ),
          TextField(
              controller: conformpassController,
              decoration: InputDecoration(
                  hintText: "Confirm Password", border: OutlineInputBorder())),
          SizedBox(
            height: 10,
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  onPressed: () async {
                    if (InputValidation.validateFeild(
                            "Name", nameController.text.trim()) &&
                        InputValidation.validateFeild(
                            "Email", emailController.text.trim()) &&
                        InputValidation.validateFeild(
                            "Password", passController.text.trim())) {
                      if (InputValidation.validatePasswords(
                          passController.text, conformpassController.text))
                        AuthController.instance.registerUser(
                            emailController.text.trim(),
                            passController.text.trim());
                    }
                  },
                  child: Text("Signup"))),
          SizedBox(
            height: 14,
          ),
          TextButton(
              onPressed: () {
                // Navigator.pop(context, MaterialPageRoute(builder: (context) {
                //   return LoginPage();
                // }));
                Get.back();
              },
              child: Text("Alread have an account? Login here")),
        ],
      ),
    ));
  }
}
