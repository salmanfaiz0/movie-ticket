import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/utils/dummy_data.dart';

class MovieItems extends StatelessWidget {
  const MovieItems({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      // color: Colors.red,
      height: 186,
      width: size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(11),
          child: Column(children: [
            Image.asset(
              movies[index].bannerUrl,
              height: 110,
              width: 110,
            ),
            SizedBox(
              height: 10,
            ),
            Text(movies[index].title),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                SizedBox(
                  width: 5,
                ),
                Text("${movies[index].like}")
              ],
            )
          ]),
        ),
      ),
    );
  }
}
