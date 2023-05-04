import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_recommendation_system/app/data/const/app_colors.dart';
import 'package:movie_recommendation_system/app/data/widgets/home_screen_movie_tile.dart';
import 'package:movie_recommendation_system/app/routes/app_pages.dart';

import '../controllers/movie_screen_controller.dart';
import 'package:http/http.dart' as http;

class MovieScreenView extends GetView<MovieScreenController> {
  const MovieScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainDarkModeColor,
      appBar: AppBar(
        title: GestureDetector(
          onTap: () => Get.toNamed(Routes.SEARCH_SCREEN),
          child: Container(
              height: 42,
              padding: EdgeInsets.symmetric(horizontal: 12),
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(7)),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    "Search Movies Similar to...",
                    style: TextStyle(color: Color(0xFF686868), fontSize: 18),
                  )
                ],
              )),
        ),
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
