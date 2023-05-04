class RecommendedMovie {
  final String title;
  final String description;
  final String popularity;
  final String posterPath;
  final String backdropPosterPath;

  final String releaseDate;
  final List<SpokenLanguages> spokenLanguages;
  final List<Genre> genres;

  const RecommendedMovie(
      {required this.posterPath,
      required this.backdropPosterPath,
      required this.releaseDate,
      required this.spokenLanguages,
      required this.genres,
      required this.title,
      required this.description,
      required this.popularity});

  factory RecommendedMovie.fromJson(Map<String, dynamic> json) {
    return RecommendedMovie(
      title: json['original_title'] ?? "",
      description: json['overview'] ?? "",
      popularity: json['vote_average'].toString() ?? "",
      backdropPosterPath: json['backdrop_path'] ?? "",
      posterPath: json['poster_path'] ?? "",
      releaseDate: json['release_date'] ?? "",
      spokenLanguages: json['spoken_languages'] != null
          ? List<SpokenLanguages>.from((json['spoken_languages'] as List)
              .map((x) => SpokenLanguages.fromJson(x)))
          : [],
      genres: json['genres'] != null
          ? List<Genre>.from(json['genres'].map((x) => Genre.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['original_title'] = this.title;
    json['overview'] = this.description;
    json['vote_average'] = this.popularity;
    json['poster_path'] = this.posterPath;
    json['backdrop_path'] = this.backdropPosterPath;
    json['release_date'] = this.releaseDate;
    if (this.genres != null) {
      json['genres'] = this.genres.map((e) => e.toJson()).toList();
    }
    if (this.spokenLanguages != null) {
      json['spoken_languages'] =
          this.spokenLanguages.map((e) => e.toJson()).toList();
    }
    return json;
  }
}

// Define a list of movies to display in the GridView

class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['id'] = this.id;
    json['name'] = this.name;
    return json;
  }
}

class SpokenLanguages {
  final String languageName;
  SpokenLanguages({required this.languageName});

  factory SpokenLanguages.fromJson(Map<String, dynamic> json) {
    return SpokenLanguages(languageName: json['english_name'] ?? "");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();

    json['english_name'] = this.languageName;
    return json;
  }
}
