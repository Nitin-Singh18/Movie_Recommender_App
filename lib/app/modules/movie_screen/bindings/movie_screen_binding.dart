import 'package:get/get.dart';

import '../controllers/movie_screen_controller.dart';

class MovieScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieScreenController>(
      () => MovieScreenController(),
    );
  }
}
