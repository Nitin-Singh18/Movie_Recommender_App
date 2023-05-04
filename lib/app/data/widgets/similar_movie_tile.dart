import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:movie_recommendation_system/app/data/const/app_colors.dart';
import 'package:movie_recommendation_system/app/data/const/const.dart';
import 'package:movie_recommendation_system/app/data/model/recommended_movies.dart';
import 'package:movie_recommendation_system/app/modules/movie_detail_screen/views/movie_detail_screen_view.dart';
import 'package:movie_recommendation_system/app/routes/app_pages.dart';

class SimilarMovieTile extends StatelessWidget {
  final RecommendedMovie movie;
  const SimilarMovieTile({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.MOVIE_DETAIL_SCREEN, arguments: movie);
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.white38),
            borderRadius: BorderRadius.circular(7)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 120,
              width: 80,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(8)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  'https://image.tmdb.org/t/p/original/${movie.posterPath}',
                  height: 120.0,
                ),
              ),
            ),
            const SizedBox(width: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          movie.title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: AppColors.textDarkModeColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(12),
                        child: Icon(
                          Icons.watch_later_outlined,
                          color: Colors.white,
                          semanticLabel: "Watch Later",
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 7.0),
                  Text(
                    movie.releaseDate,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textDarkModeColor),
                  ),
                  const SizedBox(height: 14.0),
                  Text(
                    movie.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
