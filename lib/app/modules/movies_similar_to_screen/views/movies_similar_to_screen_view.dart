import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/widgets/home_screen_movie_tile.dart';
import '../controllers/movies_similar_to_screen_controller.dart';

class MoviesSimilarToScreenView
    extends GetView<MoviesSimilarToScreenController> {
  const MoviesSimilarToScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MoviesSimilarToScreenView'),
        centerTitle: true,
      ),
      body: GetBuilder<MoviesSimilarToScreenController>(builder: (controller) {
        return GridView.builder(
          padding: EdgeInsets.all(16),
          itemCount: controller.movies!.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.7),
          itemBuilder: (BuildContext context, int index) {
            return HomeScreenMovieTile(
              movie: controller.movies![index],
            );
          },
        );
      }),
    );
  }
}
