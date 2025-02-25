import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:news_app/bloc/states.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/models/NewsResponse.dart';
import '../api/api_constant.dart';
import '../api/endpoints.dart';
import '../models/SourceResponse.dart';

class HomeCubit extends Cubit<HomeState> {
  SourceResponse? sourceResponse;
  NewsResponse? newsResponse;
  int selectedIndex = 0;

  HomeCubit() : super(InitHomeState());

  changeSelectedIndex(int index) async {
    selectedIndex = index;
    emit(ChangeSelectedTabState());
    await getNews();
  }

  getSources(String categoryName) async {
    Uri url = Uri.https(
      ApiConstant.bassUrl,
      Endpoints.unencodedPathSoures,
      {'apiKey': ApiConstant.apiKey, 'category': categoryName},
    );
    emit(GetSourcesLoadingState());

    try {
      var response = await http.get(url);
      var bodyStringResponse = response.body;
      var json = jsonDecode(bodyStringResponse);
      sourceResponse = SourceResponse.fromJson(json);
      emit(GetSourcesSuccessState());
      await getNews();
    } catch (e) {
      emit(GetSourcesErrorState());
    }
  }

  getNews() async {
    emit(GetNewsLoadingState());

    Uri url = Uri.https(
      ApiConstant.bassUrl,
      Endpoints.unencodedPathNews,
      {
        'apiKey': ApiConstant.apiKey,
        'sources': sourceResponse?.sources?[selectedIndex].id ?? '',
      },
    );

    try {
      var response = await http.get(url);
      var bodyStringResponse = response.body;
      var json = jsonDecode(bodyStringResponse);
      newsResponse = NewsResponse.fromJson(json);
      emit(GetNewsSuccessState());
    } catch (e) {
      emit(GetNewsErrorState());
    }
  }
}
