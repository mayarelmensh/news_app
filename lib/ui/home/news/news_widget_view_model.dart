import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../model/NewsResponse.dart';

class NewsWidgetViewModel extends ChangeNotifier {
  // data
  List<News>? newsList;
  List<News>? filteredNewsList;
  String? errorMessage;
  bool? isSelected;
  News? news;
  bool isLoading = false;
  bool hasMore = true;
  int currentPage = 1;
  final int pageSize = 20;

  void getNewsBySourceId(String sourceId) async {
    newsList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManager.getNewsBySourceId(sourceId);
      if (response.status == 'error') {
        errorMessage = response.message!;
      } else {
        newsList = response.articles!;
        filteredNewsList = newsList;
      }
    } catch (e) {
      errorMessage = 'error load news list';
    }
    notifyListeners();
  }

  void goToNewByUrl(String url) async {
    await launchUrl(Uri.parse(url));
    notifyListeners();
  }

  // Future<void> loadNews(String sourceId) async {
  //   newsList = null;
  //   errorMessage = null;
  //   filteredNewsList = null;
  //   notifyListeners();
  //   try {
  //     var response = await ApiManager.getNewsBySourceId(sourceId);
  //     if (response.status == 'error') {
  //       errorMessage = response.message;
  //     } else {
  //       newsList = response.articles;
  //       filteredNewsList = newsList;
  //     }
  //   } catch (e) {
  //     errorMessage = 'Error loading news';
  //   }
  //   notifyListeners();
  // }

  void searchNew(String query) async {
    if (query.isEmpty) {
      filteredNewsList = newsList;
    } else {
      filteredNewsList = newsList
          ?.where((news) =>
              news.title?.toLowerCase().contains(query.toLowerCase()) ?? false)
          .toList();
    }
    print(filteredNewsList);
    notifyListeners();

    //  newsList=null;
    //  errorMessage=null;
    //  notifyListeners();
    // try {
    //   var response = await ApiManager.searchNew(query);
    //
    //   if(response.status=='error'){
    //      errorMessage=response.message;
    //   }else{
    //     newsList=response.articles;
    //   }
    // }catch(e){
    //   errorMessage='Error occurred while searching news';
    // }
  }

  Future<void> loadNewsBySource(String sourceId) async {
    if (isLoading || !hasMore) return;
    isLoading = true;
    notifyListeners();

    try {
      var response = await ApiManager.getNewsBySourceId(sourceId);
      if (response.articles != null && response.articles!.isNotEmpty) {
        newsList?.addAll(response.articles!);
        currentPage++;
      } else {
        hasMore = false;
      }
    } catch (e) {
      print("Error loading news: $e");
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
