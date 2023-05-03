import 'dart:convert';

import 'package:http/http.dart' as http;

class SearchFunction {
  Future<List?> movieQuery(String movieName) async {
    try {
      String baseUrl = "http://10.0.2.2:5000/search_movies/$movieName";
      final result = await http.get(Uri.parse(baseUrl));
      final Map<String, dynamic> decodeJson = json.decode(result.body);
      final List movies = decodeJson['matching_movies'];
      final List<String> searchedMovies = [];
      print(result.body);
      for (var element in movies) {
        searchedMovies.add(element);
        // print(element);
      }

      return searchedMovies;
    } catch (e) {
      print(e);
    }
  }
}
