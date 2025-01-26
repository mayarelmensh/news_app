import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/ui/home/news/news_widget_view_model.dart';
import 'package:provider/provider.dart';

class NewItem extends StatelessWidget {
  News news;
  List<News>? listNews;

  NewItem({
    required this.news,
    this.isSelected = false,
  });

  bool isSelected;
  late String url;
  NewsWidgetViewModel viewModel = NewsWidgetViewModel();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<NewsWidgetViewModel>(
        builder: (context, viewModel, child) {
          return Container(
            margin: EdgeInsets.symmetric(
                horizontal: width * 0.04, vertical: height * 0.01),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: !isSelected
                    ? Border.all(
                        color: Theme.of(context).indicatorColor, width: 2)
                    : Border.all(
                        color: Colors.transparent,
                      )),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    isSelected ? news.content! : news.title!,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  SizedBox(
                    height: height * 0.015,
                  ),
                  !isSelected
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('By: ${news.author?.substring(0, 8) ?? ''}',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12)),
                            Text(
                              news.publishedAt?.substring(0, 10) ?? '',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            )
                          ],
                        )
                      : SizedBox(
                          height: height * 0.07,
                          width: width * 0.7,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14)),
                                  backgroundColor:
                                      Theme.of(context).indicatorColor),
                              onPressed: () {
                                print(news.url);
                                viewModel.goToNewByUrl(news.url!);
                              },
                              child: Text(
                                'View All Artical',
                                style: Theme.of(context).textTheme.bodyLarge,
                              )),
                        )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

