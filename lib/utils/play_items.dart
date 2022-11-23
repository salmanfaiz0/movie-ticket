import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/utils/dummy_data.dart';

class PlayItems extends StatelessWidget {
  const PlayItems({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: 186,
      width: size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(11),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  events[index].bannerUrl,
                  height: 110,
                  width: 110,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(events[index].description),
                Text(events[index].date),
              ]),
        ),
      ),
    );
  }
}
