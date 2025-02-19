class TrendingMoviesModel {
  final String title;
  final String rate;
  final String image;

  TrendingMoviesModel({
    required this.title,
    required this.image,
    required double rate, // استقبله كـ double ثم حوّله هنا
  }) : rate = rate.toStringAsFixed(1); // تحويل الدبل إلى ستيرنج مباشرة
}
