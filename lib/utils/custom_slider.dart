import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/utils/dummy_data.dart';

class CustomSlider extends StatelessWidget {
  final index;
  const CustomSlider({super.key, this.index = 0});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.3,
        width: size.width,
        color: Colors.red,
        child: Image.asset(
          sliderData[index].url,
          fit: BoxFit.cover,
        ));
  }
}
