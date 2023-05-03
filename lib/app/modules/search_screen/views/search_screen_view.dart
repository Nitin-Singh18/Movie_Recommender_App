import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_recommendation_system/app/data/const/app_colors.dart';
import 'package:movie_recommendation_system/app/routes/app_pages.dart';

import '../controllers/search_screen_controller.dart';

class SearchScreenView extends GetView<SearchScreenController> {
  const SearchScreenView({Key? key}) : super(key: key);
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainDarkModeColor,
      appBar: AppBar(
        backgroundColor: AppColors.mainDarkModeColor,
        automaticallyImplyLeading: false,
        title: Container(
          height: 42,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Material(
            borderRadius: BorderRadius.circular(7),
            elevation: 1,
            child: TextFormField(
              // controller: controller.searchController,
              onChanged: (value) {
                controller.getSearchedMovies(value);

                if (value.length == 0) {
                  controller.searchResults
                      .removeRange(0, controller.searchResults.length - 1);
                }
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 23,
                ),
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.only(top: 10),
                hintText: "Search Movies similar to ...",
                hintStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(7),
                    ),
                    borderSide: BorderSide.none),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(7),
                  ),
                  borderSide: BorderSide(
                    color: Colors.black38,
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : controller.searchResults.isEmpty
                ? controller.searchText.isEmpty
                    ? Center(
                        child: Text("Search Movie"),
                      )
                    : Center(child: Text('No movies found'))
                : ListView.builder(
                    itemCount: controller.searchResults.length,
                    itemBuilder: (context, index) {
                      String movie = controller.searchResults[index];
                      return ListTile(
                        // leading: Image.network(
                        //   'https://image.tmdb.org/t/p/w92${movie.posterPath}',
                        // ),
                        onTap: () {
                          Get.toNamed(Routes.MOVIES_SIMILAR_TO_SCREEN,
                              arguments: {"movie_name": movie});
                        },
                        title: Text(
                          movie,
                          style: TextStyle(color: Colors.white),
                        ),
                        // subtitle: Text(movie.releaseDate),
                      );
                    },
                  ),
      ),
    );
  }
}
