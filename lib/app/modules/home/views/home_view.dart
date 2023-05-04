import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_recommendation_system/app/data/const/app_colors.dart';
import 'package:movie_recommendation_system/app/data/model/select_movies.dart';
import 'package:movie_recommendation_system/app/data/widgets/select_movie_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainDarkModeColor,
      appBar: AppBar(
        title: GetBuilder<HomeController>(
          builder: (controller) {
            return Text(controller.isSelected
                ? "Movies Selected : ${controller.selectedMovies.length}"
                : 'Select Movies You Like');
          },
        ),
        centerTitle: true,
        backgroundColor: AppColors.mainDarkModeColor,
        elevation: 1,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        itemCount: moviesOption.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.7),
        itemBuilder: (BuildContext context, int index) {
          return SelectMovieTile(movie: moviesOption[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.getMoviesData();
        },
        child: Icon(Icons.arrow_forward_rounded),
      ),
    );
  }
}
