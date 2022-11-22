import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/controller/auth_controller.dart';
import 'package:flutter_application_1/page/registerPage.dart';

import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passController = TextEditingController();
    final forgotmailController = TextEditingController();
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
          Center(child: Text("Login to your account")),
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
            height: 5,
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                  onPressed: () {
                    Get.defaultDialog(
                        title: "Forgot Password?",
                        content: TextFormField(
                          controller: forgotmailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Email address",
                          ),
                        ),
                        radius: 11,
                        onWillPop: () {
                          forgotmailController.text = "";
                          return Future.value(true);
                        },
                        confirm: ElevatedButton(
                            onPressed: () {
                              AuthController.instance.forgotPassword(
                                  forgotmailController.text.trim());
                              forgotmailController.text = "";
                              Get.back();
                            },
                            child: Text("Send Reset Email")));
                  },
                  child: Text("Forgot Password?"))),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  onPressed: () {
                    AuthController.instance.login(emailController.text.trim(),
                        passController.text.trim());
                  },
                  child: Text("Login"))),
          SizedBox(
            height: 14,
          ),
          TextButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return RegisterPage();
                // }));
                Get.to(RegisterPage());
              },
              child: Text("Don't have an account? Sign up here.")),
        ],
      ),
    ));
  }
}
