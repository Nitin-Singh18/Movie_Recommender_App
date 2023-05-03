import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_recommendation_system/app/data/GetStorage/get-storage.dart';
import 'package:movie_recommendation_system/app/data/functions/get_recommended_movies.dart';
import 'package:movie_recommendation_system/app/data/model/recommended_movies.dart';
import 'package:movie_recommendation_system/app/data/model/select_movies.dart';

class HomeController extends GetxController {
  final List<SelectMovies> selectedMovies = [];
  bool isSelected = false;
  final List<RecommendedMovie>? allRecommendedMovies = [];

  void onMovieSelect(SelectMovies movie) {
    if (selectedMovies.contains(movie)) {
      selectedMovies.remove(movie);
      if (selectedMovies.isEmpty) {
        isSelected = false;
      }
    } else {
      if (selectedMovies.isNotEmpty) {
        print("${isSelected} Not empty");
        selectedMovies.add(movie);
      } else {
        selectedMovies.add(movie);
        isSelected = true;
        print("${isSelected} empty");
      }
    }
    update();
  }

  void getMoviesData() async {
    for (var element in selectedMovies) {
      final List<RecommendedMovie>? movies =
          await RecommendedMovies.movieSearchQuery(element.movieName);

      if (allRecommendedMovies!.contains(movies)) {
        print("already in");
      } else {
        allRecommendedMovies!.addAll(movies!);
      }
      // print();

      // for (var element in movies!) {

      // }
    }
    await MyStorage.saveArguments(allRecommendedMovies!);
    print("data");
    print(await MyStorage.getSavedArguments());
    // await MyStorage.box.erase();
    // debugPrint("${allRecommendedMovies} working");
  }
}
