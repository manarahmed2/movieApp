class MovieModel {
  final String title;
  final String date;
  final String rate;
  final String image;
  final String media_type;

  MovieModel(
      {required this.media_type,
      required this.title,
      required this.date,
      required this.image,
      required this.rate});
}
