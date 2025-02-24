import 'package:news_app/models/NewsResponse.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  NewsItem({super.key, required this.articles});
  Articles articles;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.black)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  articles.urlToImage ?? '',
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                articles.title ?? '',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('by: ${articles.author?.split(" ").first}' ?? ''),
                  Text(articles.publishedAt?.substring(0, 10) ?? ''),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
