class Movie {
  final String title;
  final String director;
  final String image;

  const Movie(
      {required this.title, required this.director, required this.image});
}

// Define a list of movies to display in the GridView
const List<Movie> movies = [
  Movie(
      title: 'The Shawshank Redemption',
      director: 'Frank Darabont',
      image:
          'https://www.gstatic.com/tv/thumb/v22vodart/17420/p17420_v_v8_ak.jpg'),
  Movie(
      title: 'The Godfather',
      director: 'Francis Ford Coppola',
      image:
          'https://www.gstatic.com/tv/thumb/v22vodart/1554/p1554_v_v8_ac.jpg'),
  Movie(
      title: 'The Dark Knight',
      director: 'Christopher Nolan',
      image:
          'https://www.gstatic.com/tv/thumb/v22vodart/173378/p173378_v_v8_ad.jpg'),
  Movie(
      title: 'The Godfather: Part II',
      director: 'Francis Ford Coppola',
      image:
          'https://www.gstatic.com/tv/thumb/v22vodart/1553/p1553_v_v8_ac.jpg'),
  Movie(
      title: '12 Angry Men',
      director: 'Sidney Lumet',
      image:
          'https://www.gstatic.com/tv/thumb/v22vodart/30510/p30510_v_v8_ad.jpg'),
  Movie(
      title: 'Schindler\'s List',
      director: 'Steven Spielberg',
      image:
          'https://www.gstatic.com/tv/thumb/v22vodart/14685/p14685_v_v8_af.jpg'),
  Movie(
      title: 'The Lord of the Rings: The Return of the King',
      director: 'Peter Jackson',
      image:
          'https://www.gstatic.com/tv/thumb/v22vodart/32959/p32959_v_v8_ac.jpg'),
  Movie(
      title: 'Pulp Fiction',
      director: 'Quentin Tarantino',
      image:
          'https://www.gstatic.com/tv/thumb/v22vodart/1586/p1586_v_v8_af.jpg'),
];
