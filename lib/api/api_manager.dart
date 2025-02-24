import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constant.dart';
import 'package:news_app/api/endpoints.dart';
import 'package:news_app/models/NewsResponse.dart';
import 'package:news_app/models/SourceResponse.dart';

class ApiManager {
  static Future<SourceResponse?> getSources(String categoryName) async {
    Uri url = Uri.https(
      ApiConstant.bassUrl,
      Endpoints.unencodedPathSoures,
      {'apiKey': ApiConstant.apiKey, 'category': categoryName},
    );
    try {
      var response = await http.get(url);
      var bodyStringResponse = response.body; //string
      var json = jsonDecode(bodyStringResponse); // from string to json
      return SourceResponse.fromJson(json); //from json to object
    } catch (e) {
      rethrow;
    }
  }

  static Future<NewsResponse?> getNews(String sourceId) async {
    Uri url = Uri.https(
      ApiConstant.bassUrl,
      Endpoints.unencodedPathNews,
      {
        'apiKey': ApiConstant.apiKey,
        'sources': sourceId,
      },
    );
    try {
      var response = await http.get(url);
      var bodyStringResponse = response.body; //string
      var json = jsonDecode(bodyStringResponse); // from string to json
      return NewsResponse.fromJson(json); //from json to object
    } catch (e) {
      rethrow;
    }
  }
}
