import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/api/api_constants.dart';
import 'package:news/api/end_points.dart';
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/sourceResponse.dart';

class ApiManager {
//https://newsapi.org/v2/top-headlines/sources?apiKey=8096832e9f874dde89a5fbfcb4d53b1

  static Future<SourceResponse?> getSources(String categoryId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.sourceApi,
        {'apiKey': ApiConstants.apiKey, 'category': categoryId});
    try {
      var response = await http.get(url);
      var responseBody = response.body; //String
      var json = jsonDecode(responseBody); //json
      return SourceResponse.fromJson(json); //object
    } catch (e) {
      throw e;
    }
    // SourceResponse.fromJson(jsonEncode(response.body));
  }

//https://newsapi.org/v2/everything?q=bitcoin&apiKey=8096832e9f874dde89a5fbfcb4d53b1b
  static Future<NewsResponse> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, EndPoints.newApi, {
      'apiKey': ApiConstants.apiKey,
      'sources': sourceId,
    });
    try {
      var response = await http.get(url);
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
    // NewsResponse.fromJson(jsonDecode(response.body));
  }

  static Future<NewsResponse> searchNew(String query) async {
    var response = await http.get(Uri.parse(
        'https://${ApiConstants.baseUrl}/${EndPoints.newApi}?q=$query&apiKey=${ApiConstants.apiKey}'));
    if (response.statusCode == 200) {
      return NewsResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('faild to load new');
    }
  }
}

// //GET https://newsapi.org/v2/everything?q=apple&from=2025-01-23&to=2025-01-23&sortBy=popularity&apiKey=8096832e9f874dde89a5fbfcb4d53b1b
// getAllNesByQParameter(String qParameter){
// Uri url=Uri.https(ApiConstants.baseUrl,EndPoints.newApi,{
//   'apiKey' :ApiConstants.apiKey,
//   'q': 'apple&from=2025-01-23&to=2025-01-23',
//
// })
// }
