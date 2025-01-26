import 'package:flutter/material.dart';
import 'package:news/api/api_manager.dart';

import '../../model/sourceResponse.dart';

class CategoryDetailsViewModel extends ChangeNotifier {
  List<Source>? sourcesList;
  String? errorMessage;

  void getSources(String categoryId) async {
    sourcesList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManager.getSources(categoryId);
      if (response?.status == 'error') {
        errorMessage = response!.message!;
      } else {
        sourcesList = response!.sources!;
      }
    } catch (e) {
      errorMessage = 'error load sources list';
    }
    notifyListeners();
  }
}
