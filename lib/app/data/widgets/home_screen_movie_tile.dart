import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:movie_recommendation_system/app/data/model/recommended_movies.dart';
import 'package:movie_recommendation_system/app/modules/movie_screen/controllers/movie_screen_controller.dart';

class HomeScreenMovieTile extends StatelessWidget {
  final RecommendedMovie movie;

  const HomeScreenMovieTile({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<HomeController>();
    print(movie.posterPath);
    return InkWell(
      onTap: () {
        // controller.onMovieSelect(movie);
        // print(controller.selectedMovies);
      },
      child: GetBuilder<MovieScreenController>(
        builder: (controller) {
          return Container(
            decoration: BoxDecoration(
                border: Border.all(
                  // width: controller.selectedMovies.contains(movie) ? 4 : 2,
                  color: Colors.black,
                ),
                borderRadius: BorderRadius.circular(12)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  "https://image.tmdb.org/t/p/original/${movie.posterPath}",
                  fit: BoxFit.cover,
                )),
          );
        },
      ),
    );
  }
}
