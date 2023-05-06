import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_recommendation_system/app/data/const/app_colors.dart';
import 'package:movie_recommendation_system/app/data/const/const.dart';

import '../controllers/movie_detail_screen_controller.dart';

class MovieDetailScreenView extends GetView<MovieDetailScreenController> {
  MovieDetailScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainDarkModeColor,
      appBar: AppBar(
        title: Text(controller.movie.title),
        backgroundColor: AppColors.mainDarkModeColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/original/${controller.movie.backdropPosterPath}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(controller.movie.title,
                        style: AppTextStyle.headingStyle),
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(12),
                    child: Tooltip(
                      message: "Watch Later",
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(12),
                    child: Tooltip(
                      message: "Watch Later",
                      child: Icon(
                        Icons.watch_later_outlined,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 8),
              GetBuilder<MovieDetailScreenController>(builder: (context) {
                return Wrap(children: [
                  Text(
                    controller.movie.description,
                    style: AppTextStyle.descriptionStyle,
                    maxLines: controller.isExpanded ? null : 2,
                  ),
                  InkWell(
                    onTap: () {
                      controller.expand();
                    },
                    child: Text(
                      controller.isExpanded ? "See less" : "See more",
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ]);
              }),
              SizedBox(height: 16),
              Text('Genres', style: AppTextStyle.headingStyle),
              SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: controller.movie.genres
                    .map((genre) => Chip(
                            label: Text(
                          genre.name,
                        )))
                    .toList(),
              ),
              SizedBox(height: 16),
              Text(
                'Languages',
                style: AppTextStyle.headingStyle,
              ),
              SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: controller.movie.spokenLanguages
                    .map((language) => Chip(
                            label: Text(
                          language.languageName,
                        )))
                    .toList(),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Popularity',
                        style: AppTextStyle.headingStyle,
                      ),
                      SizedBox(height: 8),
                      Text(
                        controller.movie.popularity,
                        style: AppTextStyle.descriptionStyle,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Release Date',
                        style: AppTextStyle.headingStyle,
                      ),
                      SizedBox(height: 8),
                      Text(
                        controller.movie.releaseDate,
                        style: AppTextStyle.descriptionStyle,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              // Container(
              //   height: 60,
              //   width: ,
              //   alignment: Alignment.center,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(7),
              //       color: Color(0xFF5A4C6B)),
              //   child: Text(
              //     "Like Movie",
              //     style: TextStyle(fontSize: 18, color: Colors.white),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
