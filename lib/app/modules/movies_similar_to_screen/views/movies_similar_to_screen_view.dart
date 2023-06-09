import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_recommendation_system/app/data/const/app_colors.dart';
import 'package:movie_recommendation_system/app/data/widgets/similar_movie_tile.dart';

import '../controllers/movies_similar_to_screen_controller.dart';

class MoviesSimilarToScreenView
    extends GetView<MoviesSimilarToScreenController> {
  const MoviesSimilarToScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainDarkModeColor,
      appBar: AppBar(
        title: Text('Similar Movies to "${controller.details['movie_name']}"'),
        centerTitle: true,
        backgroundColor: AppColors.mainDarkModeColor,
      ),
      body: GetBuilder<MoviesSimilarToScreenController>(builder: (controller) {
        return ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: controller.movies!.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: SimilarMovieTile(
                movie: controller.movies![index],
              ),
            );
          },
        );
      }),
    );
  }
}
