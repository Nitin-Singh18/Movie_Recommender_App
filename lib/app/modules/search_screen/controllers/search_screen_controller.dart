import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_recommendation_system/app/modules/search_screen/functions/search_function.dart';

class SearchScreenController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final searchText = ''.obs;
  final searchResults = [].obs;
  final isLoading = false.obs;
  // late FocusNode focusNode;

  void getSearchedMovies(String query) async {
    isLoading.value = true;
    searchText.value = query;
    searchResults.value =
        await SearchFunction().movieQuery(searchText.value) ?? [];

    isLoading.value = false;
  }

  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   final context = Get.context;

  //   focusNode = FocusNode();
  //   Future.delayed(Duration(milliseconds: 500), () {
  //     FocusScope.of(context!).requestFocus(focusNode);
  //   });
  //   super.onInit();
  // }
}
