import 'package:get/get.dart';

import '../controllers/movie_detail_screen_controller.dart';

class MovieDetailScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieDetailScreenController>(
      () => MovieDetailScreenController(),
    );
  }
}
