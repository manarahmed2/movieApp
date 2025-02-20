import 'package:flutter/material.dart';

class SimilarCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String year;

  const SimilarCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.year,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 100,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(
                  imageUrl.isNotEmpty
                      ? imageUrl
                      : "https://via.placeholder.com/100x120", // ✅ صورة افتراضية
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Flexible(
            child: Text(
              "$title\n($year)",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
