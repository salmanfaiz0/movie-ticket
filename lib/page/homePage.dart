import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/controller/auth_controller.dart';
import 'package:flutter_application_1/page/profile_page.dart';
import 'package:flutter_application_1/utils/custom_slider.dart';
import 'package:flutter_application_1/utils/dummy_data.dart';
import 'package:flutter_application_1/utils/event_items.dart';
import 'package:flutter_application_1/utils/menu_item.dart';
import 'package:flutter_application_1/utils/movie_items.dart';
import 'package:flutter_application_1/utils/play_items.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _currentPagenotifer = ValueNotifier<int>(0);
  PageController _pageController = PageController();
  String city = cities[0];
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.blueGrey[900],
          leading: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10),
            child: GestureDetector(
              onTap: () {
                Get.to(ProfilePage());
              },
              child: Image.network(
                  "https://cdn-icons-png.flaticon.com/512/194/194938.png",
                  height: 90,
                  width: 90),
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Name"),
                DropdownButton(
                    value: city,
                    dropdownColor: Colors.grey,
                    isDense: true,
                    items: cities
                        .map(
                          (e) => DropdownMenuItem<String>(
                            value: e,
                            child: Text(e),
                          ),
                        )
                        .toList(),
                    onChanged: (s) {
                      setState(() {
                        city = s!;
                      });
                    })
              ],
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications),
            ),
            IconButton(
                onPressed: () {
                  AuthController.instance.signOut();
                },
                icon: Icon(Icons.exit_to_app))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.red,
          width: size.width,
          height: size.height * 2.14,
          child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      color: Colors.green,
                      height: size.height * 0.22,
                      width: size.width,
                      // color: Colors.green,
                      child: PageView.builder(
                          controller: _pageController,
                          onPageChanged: (int page) {
                            _currentPagenotifer.value = page;
                          },
                          itemCount: sliderData.length,
                          itemBuilder: (context, index) => CustomSlider(
                                index: index,
                              )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CirclePageIndicator(
                          currentPageNotifier: _currentPagenotifer,
                          itemCount: sliderData.length),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "Seat Categories",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                MenuItems(),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    "Recommended seats",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                MovieItems(),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "nearby thearters".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        "View All",
                        style: TextStyle(
                            color: Colors.pink, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 300,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                    zoomControlsEnabled: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/icons/camera.png",
                        scale: 25,
                      ),
                      Text(
                        " Events".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Spacer(),
                      Text(
                        "View All",
                        style: TextStyle(
                            color: Colors.pink, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                EventItems(),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/icons/video.png",
                        scale: 25,
                      ),
                      Text(
                        " Play".toUpperCase(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Spacer(),
                      Text(
                        "View All",
                        style: TextStyle(
                            color: Colors.pink, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                PlayItems(),
                Divider(),
              ]),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: 0,
      //   unselectedItemColor: Colors.black,
      //   selectedItemColor: Colors.amber,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   items: [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.monitor_heart_rounded), label: ""),
      //   ],
      // ),
    );
  }
}
