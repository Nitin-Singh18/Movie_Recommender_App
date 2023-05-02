import 'package:get_storage/get_storage.dart';
import 'package:movie_recommendation_system/app/data/model/recommended_movies.dart';

class MyStorage {
  static final box = GetStorage();

  static Future<void> saveArguments(List<RecommendedMovie> arguments) async {
    await box.write(
        'myArguments', arguments.map((arg) => arg.toJson()).toList());
  }

  static List<RecommendedMovie> getSavedArguments() {
    final jsonList = box.read<List<dynamic>>('myArguments') ?? [];
    return jsonList.map((json) => RecommendedMovie.fromJson(json)).toList();
  }
}
