class MovieModel {
  final int movieId; // إضافة الـ id
  final String title;
  final String date;
  final String rate;
  final String image;
  final String mediaType;

  MovieModel({
    required this.movieId, // مطلوب
    required this.mediaType,
    required this.title,
    required this.date,
    required this.image,
    required this.rate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json, String category) {
    return MovieModel(
      movieId: json["id"] ?? 0, // إحضار id من JSON
      mediaType: json['media_type'] ?? category,
      title: category == "movie"
          ? json["original_title"] ?? "No Title"
          : json["original_name"] ?? "No Title",
      image: json["poster_path"] ?? "No Image",
      date: category == "movie"
          ? json["release_date"] ?? "No Date"
          : json["first_air_date"] ?? "No Date",
      rate: (json['vote_average'] ?? 0.0).toString(),
    );
  }
}