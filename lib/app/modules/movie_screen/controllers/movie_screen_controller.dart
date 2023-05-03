import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_recommendation_system/app/data/model/recommended_movies.dart';

import '../../../data/GetStorage/get-storage.dart';

class MovieScreenController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  List<RecommendedMovie> movies = [];
  List<String> posterPath = [];

  Future<void> getMovieData() async {
    movies = await MyStorage.getSavedArguments();

    print("${movies} hi");
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getMovieData();
    super.onInit();
  }
}
