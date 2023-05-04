import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_recommendation_system/app/modules/home/controllers/home_controller.dart';

import '../model/select_movies.dart';

class SelectMovieTile extends StatelessWidget {
  final SelectMovies movie;
  SelectMovieTile({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return InkWell(
      onTap: () {
        controller.onMovieSelect(movie);
        print(controller.selectedMovies);
      },
      child: GetBuilder<HomeController>(
        builder: (controller) {
          return Container(
            decoration: BoxDecoration(
                border: Border.all(
                  width: controller.selectedMovies.contains(movie) ? 3 : 2,
                  color: controller.selectedMovies.contains(movie)
                      ? Colors.green
                      // Color(0xFF7A6791)
                      : Colors.black,
                ),
                borderRadius: BorderRadius.circular(12)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                movie.moviePoster,
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
