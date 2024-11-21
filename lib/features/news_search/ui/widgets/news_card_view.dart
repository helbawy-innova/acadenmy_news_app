import 'package:flutter/material.dart';

import '../../domain/models/news_model.dart';

class NewsCardView extends StatelessWidget {
  const NewsCardView({super.key,required this.newsModel});
  final NewsModel newsModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              newsModel.imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(newsModel.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                SizedBox(height: 4),
                Expanded(
                  child: Text(
                    newsModel.description,
                    style: TextStyle(fontSize: 16),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}