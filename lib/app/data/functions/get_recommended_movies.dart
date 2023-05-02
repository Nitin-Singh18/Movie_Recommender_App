import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_recommendation_system/app/data/model/recommended_movies.dart';

class RecommendedMovies {
  static Future<List<RecommendedMovie>?> movieSearchQuery(
      String movieName) async {
    try {
      String baseUrl = "http://10.0.2.2:5000/predicted_movies/$movieName";
      final result = await http.get(Uri.parse(baseUrl));
      // if (result.statusCode == 0) {
      final Map<String, dynamic> decodeJson = json.decode(result.body);
      final List movies = decodeJson['movies'];
      final List<RecommendedMovie> recommendedMovies = [];
      for (var element in movies) {
        recommendedMovies.add(RecommendedMovie.fromJson(element));
      }
      return recommendedMovies;
      // }

      // debugPrint(result.body);
      // return [];
    } catch (e) {
      print(e);
    }
  }
}
