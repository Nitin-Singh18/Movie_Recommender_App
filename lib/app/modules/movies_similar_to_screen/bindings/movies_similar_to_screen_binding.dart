import 'package:get/get.dart';

import '../controllers/movies_similar_to_screen_controller.dart';

class MoviesSimilarToScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoviesSimilarToScreenController>(
      () => MoviesSimilarToScreenController(),
    );
  }
}
