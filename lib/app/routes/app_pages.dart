import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/movie_detail_screen/bindings/movie_detail_screen_binding.dart';
import '../modules/movie_detail_screen/views/movie_detail_screen_view.dart';
import '../modules/movie_screen/bindings/movie_screen_binding.dart';
import '../modules/movie_screen/views/movie_screen_view.dart';
import '../modules/movies_similar_to_screen/bindings/movies_similar_to_screen_binding.dart';
import '../modules/movies_similar_to_screen/views/movies_similar_to_screen_view.dart';
import '../modules/search_screen/bindings/search_screen_binding.dart';
import '../modules/search_screen/views/search_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.MOVIE_SCREEN,
      page: () => const MovieScreenView(),
      binding: MovieScreenBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH_SCREEN,
      page: () => const SearchScreenView(),
      binding: SearchScreenBinding(),
    ),
    GetPage(
      name: _Paths.MOVIES_SIMILAR_TO_SCREEN,
      page: () => const MoviesSimilarToScreenView(),
      binding: MoviesSimilarToScreenBinding(),
    ),
    GetPage(
      name: _Paths.MOVIE_DETAIL_SCREEN,
      page: () => MovieDetailScreenView(),
      binding: MovieDetailScreenBinding(),
    ),
  ];
}
