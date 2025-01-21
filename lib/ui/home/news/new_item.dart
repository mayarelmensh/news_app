import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/model/NewsResponse.dart';

class NewItem extends StatelessWidget {
  News news;

  NewItem({required this.news});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: width * 0.04, vertical: height * 0.01),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border:
              Border.all(color: Theme.of(context).indicatorColor, width: 2)),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                width: double.infinity,
                height: height * 0.25,
                imageUrl: news.urlToImage ?? "",
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: Colors.grey,
                  ),
                ),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Text(
              news.title ?? '',
              style: Theme.of(context).textTheme.labelLarge,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('By: ${news.author?.substring(0, 8) ?? ''}',
                    style: TextStyle(color: Colors.grey, fontSize: 12)),
                Text(
                  news.publishedAt?.substring(0, 10) ?? '',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
