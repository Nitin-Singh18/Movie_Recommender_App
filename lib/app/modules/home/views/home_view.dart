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
      floatingActionButton: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: FloatingActionButton.extended(
            onPressed: () {
              // add your code here
            },
            backgroundColor: Colors.black,
            label: GetBuilder<HomeController>(builder: (context) {
              return Text(
                  controller.isSelected ? "Recommend Movies" : 'Select Movie');
            }),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}
