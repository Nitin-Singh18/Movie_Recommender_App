import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_recommendation_system/app/data/const/app_colors.dart';
import 'package:movie_recommendation_system/app/data/widgets/home_screen_movie_tile.dart';
import 'package:movie_recommendation_system/app/routes/app_pages.dart';

import '../../../data/widgets/select_movie_widget.dart';
import '../controllers/movie_screen_controller.dart';
import 'package:http/http.dart' as http;

class MovieScreenView extends GetView<MovieScreenController> {
  const MovieScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainDarkModeColor,
      appBar: AppBar(
        title: Text("Recommended Movies"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              onPressed: () {
                Get.toNamed(Routes.SEARCH_SCREEN);
              },
              icon: Icon(Icons.search),
              color: Colors.white,
            ),
          )
        ],
        leadingWidth: 2.4,
        backgroundColor: AppColors.mainDarkModeColor,
        automaticallyImplyLeading: false,
      ),
      body: GetBuilder<MovieScreenController>(builder: (controller) {
        return GridView.builder(
          padding: EdgeInsets.all(16),
          itemCount: controller.movies.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.7),
          itemBuilder: (BuildContext context, int index) {
            return HomeScreenMovieTile(
              movie: controller.movies[index],
            );
          },
        );
      }),
    );
  }
}
