import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:news/model/category_model.dart';
import 'source_tab_widget.dart';

class CategoryDetails extends StatefulWidget {
  static const String routeName = 'category_screen';
  CategoryModel category;

  CategoryDetails({required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.getSources(widget.category.id),
        builder: (context, snapshot) {
          //todo : loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.grey,
              ),
            );
          } else if (snapshot.hasError) {
            //catch e
            return Column(
              children: [
                Text('something went wrong'),
                TextButton(
                    onPressed: () {
                      setState(() {});
                      ApiManager.getSources(widget.category.id);
                    },
                    child: Text('Try Again'))
              ],
            );
          }

          //todo: server=> response  (success,error)  check status
          //todo: server=> error
          if (snapshot.data!.status == 'error') {
            return Column(
              children: [
                Text(snapshot.data!.message!),
                // data is object of source response
                TextButton(
                    onPressed: () {
                      ApiManager.getSources((widget.category.id));
                      setState(() {});
                    },
                    child: Text('Try Again'))
              ],
            );
          }

          //todo : server=> success
          var sourcesList = snapshot.data!.sources!;
          return SourceTabWidget(
            sourcesList: sourcesList,
          );
        });
  }
}
