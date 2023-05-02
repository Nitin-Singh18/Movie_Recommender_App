import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_recommendation_system/app/routes/app_pages.dart';

import '../../../data/model/movies.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF262F42),
      appBar: AppBar(
        title: Text('Select Movies You Like'),

        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(Routes.MOVIE_SCREEN);
              },
              icon: Icon(Icons.search))
        ],
        // backgroundColor: Color(0xFFF1EFD4),
        elevation: 0,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        // crossAxisSpacing: 6,
        children: movies.map((movie) {
          return GestureDetector(
            onTap: () {
              // Navigator.pushNamed(context, '/movie-details', arguments: movie);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: Container(
                height: 80,
                child: Image.network(
                  "https://image.tmdb.org/t/p/original/4ssDuvEDkSArWEdyBl2X5EHvYKU.jpg",
                  // fit: BoxFit.fitWidth,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
