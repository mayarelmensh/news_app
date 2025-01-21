import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/sourceResponse.dart';
import 'package:news/ui/home/news/new_item.dart';

class NewWidget extends StatefulWidget {
  Source source;

  NewWidget({required this.source});

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsResponse?>(
        future: ApiManager.getNewsBySourceId(widget.source.id ?? ''),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.grey,
              ),
            );
          } else if (snapshot.hasError) {
            return Column(
              children: [
                Text(
                  'something went wrong',
                  style: TextStyle(fontSize: 20),
                ),
                ElevatedButton(
                    onPressed: () {
                      ApiManager.getNewsBySourceId(widget.source.id ?? '');
                      setState(() {});
                    },
                    child: Text('Try Again'))
              ],
            );
          }
          if (snapshot.data!.status == 'error') {
            print('erorr');
            return Center(
              child: Column(
                children: [
                  Text(
                    snapshot.data!.message!,
                    style: TextStyle(fontSize: 20),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        ApiManager.getNewsBySourceId(widget.source.id ?? '');
                        setState(() {});
                      },
                      child: Text('Try Again'))
                ],
              ),
            );
          }
          var newsList = snapshot.data!.articles!;
          return ListView.builder(
              itemBuilder: (context, index) {
                return NewItem(news: newsList[index]);
              },
              itemCount: newsList.length);
        });
  }
}
