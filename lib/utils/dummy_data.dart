import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/model/ad_slider_modeldata.dart';
import 'package:flutter_application_1/model/event_model.dart';
import 'package:flutter_application_1/model/menu_model.dart';
import 'package:flutter_application_1/model/movie_model.dart';
import 'package:flutter_application_1/utils/constant.dart';

List<String> cities = [
  "New Delhi",
  "Kolkata",
  "Bangalore",
  "Chennai",
  "Kochin",
];

List<AdSliderModel> sliderData = [
  AdSliderModel(
      url: "assets/slider_banner.png", redirectUrl: Constants.baseApiUrl),
  AdSliderModel(
      url: "assets/slider_banner5.png", redirectUrl: Constants.baseApiUrl),
  AdSliderModel(
      url: "assets/slider_banner2.jpg", redirectUrl: Constants.baseApiUrl),
  AdSliderModel(
      url: "assets/slider_banner3.jpg", redirectUrl: Constants.baseApiUrl),
];

List<MenuModel> menus = [
  MenuModel(name: "Movies", asset: "assets/icons/movie.png"),
  MenuModel(name: "Events", asset: "assets/icons/camera.png"),
  MenuModel(name: "Plays", asset: "assets/icons/video.png"),
  MenuModel(name: "Sports", asset: "assets/icons/icons.png"),
  MenuModel(name: "Activity", asset: "assets/icons/movie.png"),
  MenuModel(name: "Monum", asset: "assets/icons/movie.png"),
];

List<MovieModel> movies = [
  MovieModel(
    title: "Bigil",
    description: "description",
    actors: ["actor a", "actor b"],
    like: 84,
    bannerUrl: "assets/movies/movie2.jpg",
  ),
  MovieModel(
    title: "Kaithi",
    description: "description",
    actors: ["actor a", "actor b"],
    like: 84,
    bannerUrl: "assets/movies/movie1.jpg",
  ),
  MovieModel(
    title: "Asuran",
    description: "description",
    actors: ["actor a", "actor b"],
    like: 84,
    bannerUrl: "assets/movies/movie1.jpg",
  ),
  MovieModel(
    title: "Sarkar",
    description: "description",
    actors: ["actor a", "actor b"],
    like: 84,
    bannerUrl: "assets/movies/movie1.jpg",
  ),
];

List<EventModel> events = [
  EventModel(
    title: "Happy Halloween 2K19",
    description: "Music show",
    date: "02/2/21",
    bannerUrl: "assets/events/movie1.jpg",
  ),
  EventModel(
    title: "Music DJ king monger Sert...",
    description: "Music show",
    date: "02/2/21",
    bannerUrl: "assets/events/movie1.jpg",
  ),
  EventModel(
    title: "Summer sounds festiva..",
    description: "Comedy show",
    date: "02/2/21",
    bannerUrl: "assets/events/movie1.jpg",
  ),
  EventModel(
    title: "Happy Halloween 2K19",
    description: "Music show",
    bannerUrl: "assets/events/movie1.jpg",
    date: "02/2/21",
  ),
];

List<EventModel> plays = [
  EventModel(
    title: "Alex in wonderland",
    description: "Comedy Show",
    date: "date",
    bannerUrl: "assets/plays/play1.png",
  ),
  EventModel(
    title: "Marry poppins puffet show",
    description: "Music Show",
    date: "date",
    bannerUrl: "assets/plays/play2.png",
  ),
  EventModel(
    title: "Patrimandram special dewali",
    description: "Dibet Show",
    date: "date",
    bannerUrl: "assets/plays/play3.png",
  ),
  EventModel(
    title: "Happy Halloween 2K19",
    description: "Music Show",
    bannerUrl: "assets/plays/play4.png",
    date: "date",
  ),
];
