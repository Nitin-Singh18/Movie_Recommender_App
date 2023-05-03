import 'package:get/get.dart';

import '../../../data/functions/get_recommended_movies.dart';
import '../../../data/model/recommended_movies.dart';

class MoviesSimilarToScreenController extends GetxController {
  final details = Get.arguments;
  List<RecommendedMovie>? movies = [];
  void getMoviesData() async {
    print(details['movie_name']);
    movies = await RecommendedMovies.movieSearchQuery(details['movie_name']);
    print(movies![0].title);
    update();
    // print();

    // for (var element in movies!) {

    // }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getMoviesData();
    super.onInit();
  }

  // await MyStorage.box.erase();
  // debugPrint("${allRecommendedMovies} working");
}
