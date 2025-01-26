import 'package:flutter/material.dart';
import 'package:news/model/sourceResponse.dart';
import 'package:news/ui/home/news/new_item.dart';
import 'package:news/ui/home/news/news_widget_view_model.dart';
import 'package:provider/provider.dart';

class NewWidget extends StatefulWidget {
  Source source;
  bool? isSelected = false;

  NewWidget({required this.source, this.isSelected});

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  NewsWidgetViewModel viewModel = NewsWidgetViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getNewsBySourceId(widget.source.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
          String sourceId = "";
          viewModel.loadNewsBySource(sourceId);
        }
      }
    });
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<NewsWidgetViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.errorMessage != null) {
              return Center(
              child: Column(
                children: [
                  Text(
                      viewModel.errorMessage!,
                      style: TextStyle(fontSize: 20),
                  ),
                  ElevatedButton(
                      onPressed: () {
                          viewModel.getNewsBySourceId(widget.source.id!);
                        },
                        child: Text('Try Again'))
                ],
              ),
            );
          }
            if (viewModel.newsList == null) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.grey,
                ),
              );
            } else {
              return ListView.builder(
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) {
                                return Container(
                                    margin: EdgeInsets.all(10),
                                    height: height * 0.54,
                                    width: width * 0.99,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                    child: NewItem(
                                      news: viewModel.newsList![index],
                                      isSelected: true,
                                    ));
                              });
                        },
                        child: NewItem(news: viewModel.newsList![index]));
                  },
                  itemCount: viewModel.newsList!.length);
            }
          },
        ));
    // child: FutureBuilder<NewsResponse?>(
    //     future: ApiManager.getNewsBySourceId(widget.source.id ?? ''),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return Center(
    //           child: CircularProgressIndicator(
    //             color: Colors.grey,
    //           ),
    //         );
    //       } else if (snapshot.hasError) {
    //         return Column(
    //           children: [
    //             Text(0
    //               'something went wrong',
    //               style: TextStyle(fontSize: 20),
    //             ),
    //             ElevatedButton(
    //                 onPressed: () {
    //                   ApiManager.getNewsBySourceId(widget.source.id ?? '');
    //                   setState(() {});
    //                 },
    //                 child: Text('Try Again'))
    //           ],
    //         );
    //       }
    //       if (snapshot.data!.status == 'error') {
    //         print('erorr');
    //         return Center(
    //           child: Column(
    //             children: [
    //               Text(
    //                 snapshot.data!.message!,
    //                 style: TextStyle(fontSize: 20),
    //               ),
    //               ElevatedButton(
    //                   onPressed: () {
    //                     ApiManager.getNewsBySourceId(widget.source.id ?? '');
    //                     setState(() {});
    //                   },
    //                   child: Text('Try Again'))
    //             ],
    //           ),
    //         );
    //       }
    //       var newsList = snapshot.data!.articles!;
    //       return ListView.builder(
    //           itemBuilder: (context, index) {
    //             return NewItem(news: newsList[index]);
    //           },
    //           itemCount: newsList.length);
    //     }),
  }
}
