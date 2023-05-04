import 'package:get/get.dart';
import 'package:movie_recommendation_system/app/data/model/recommended_movies.dart';

class MovieDetailScreenController extends GetxController {
  final RecommendedMovie movie = Get.arguments;
  bool isExpanded = false;

  void expand() {
    isExpanded = !isExpanded;
    print(isExpanded);
    update();
  }
}
