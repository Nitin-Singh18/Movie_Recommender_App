import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_recommendation_system/app/data/widgets/home_screen_movie_tile.dart';

import '../../../data/widgets/select_movie_widget.dart';
import '../controllers/movie_screen_controller.dart';
import 'package:http/http.dart' as http;

class MovieScreenView extends GetView<MovieScreenController> {
  const MovieScreenView({Key? key}) : super(key: key);

  void movieQuery(String movieName) async {
    String baseUrl = "http://10.0.2.2:5000/search_movies/$movieName";
    final result = await http.get(Uri.parse(baseUrl));

    print(result.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recommended Movies"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
              color: Colors.white,
            ),
          )
        ],
      ),
      body: GetBuilder<MovieScreenController>(builder: (controller) {
        return GridView.builder(
          padding: EdgeInsets.all(16),
          itemCount: controller.posterPath.length,
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
