import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/movie_screen_controller.dart';
import 'package:http/http.dart' as http;

class MovieScreenView extends GetView<MovieScreenController> {
  const MovieScreenView({Key? key}) : super(key: key);

  void movieQuery(String movieName) async {
    String baseUrl = "http://10.0.2.2:5000/search_movies/$movieName";
    final result = await http.get(Uri.parse(baseUrl));

    print(result.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        // movieQuery("h");
        // movieSearchQuery("The Dark Knight Rises");
      }),
      appBar: AppBar(
        title: Expanded(
          child: Container(
            height: 42,
            margin: const EdgeInsets.only(left: 15),
            child: Material(
              borderRadius: BorderRadius.circular(7),
              elevation: 1,
              child: TextFormField(
                controller: controller.searchController,
                decoration: InputDecoration(
                  prefixIcon: GestureDetector(
                    onTap: () {
                      print("check");
                    },
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 23,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.only(top: 10),
                  hintText: "Search Movie.in",
                  hintStyle:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
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
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MovieScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
