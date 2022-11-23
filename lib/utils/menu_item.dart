import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/utils/dummy_data.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      // color: Colors.red,
      height: 120,
      width: size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: menus.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(22),
          child: Column(children: [
            Image.asset(
              menus[index].asset,
              height: 50,
              width: 50,
            ),
            SizedBox(
              height: 10,
            ),
            Text(menus[index].name)
          ]),
        ),
      ),
    );
  }
}
