import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/sourceResponse.dart';
import 'package:news/ui/home/news/news_widget_view_model.dart';
import 'package:provider/provider.dart';

import 'new_item.dart';

class SearchNew extends StatefulWidget {
  static const String routeName = 'search_screen';
  Source? source;

  @override
  State<SearchNew> createState() => _SearchNewState();
}

class _SearchNewState extends State<SearchNew> {
  News? news;

  NewsWidgetViewModel viewModel = NewsWidgetViewModel();

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child:
            Consumer<NewsWidgetViewModel>(builder: (context, viewModel, child) {
          return Scaffold(
            body: Container(
              padding: EdgeInsets.symmetric(
                  vertical: height * 0.03, horizontal: width * 0.03),
              // width: width*0.9,
              child: Column(
                children: [
                  TextFormField(
                    onChanged: (query) {
                      viewModel.searchNew(query);
                    },
                    controller: controller,
                    onTap: () {
                      String query = controller.text;
                      if (query.isNotEmpty) {
                        viewModel.searchNew(query);
                      }
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search,
                            color: Theme.of(context).indicatorColor),
                        hintText: 'Search',
                        hintStyle: Theme.of(context).textTheme.labelLarge,
                        suffixIcon: Icon(CupertinoIcons.xmark,
                            color: Theme.of(context).indicatorColor),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Theme.of(context).indicatorColor,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Theme.of(context).indicatorColor,
                            ))),
                  ),
                  // if (viewModel.filteredNewsList != null && viewModel.filteredNewsList!.isNotEmpty)
                  Expanded(
                    child: ListView.builder(
                      itemCount: viewModel.filteredNewsList?.length,
                      itemBuilder: (context, index) {
                        return NewItem(
                            news: viewModel.filteredNewsList![index]);
                      },
                    ),
                  ),
                  // if (viewModel.filteredNewsList == null || viewModel.filteredNewsList!.isEmpty)
                  //   Center(child: Text("No news found")),
                ],
              ),
            ),
          );
        }));
  }
}
