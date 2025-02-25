import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/bloc/cubit.dart';
import 'package:news_app/home/news/news_item.dart';

import '../../bloc/states.dart';

class NewsDetails extends StatefulWidget {
  NewsDetails({super.key, required this.sourceId});

  String sourceId;

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        HomeCubit viewModel = context.read<HomeCubit>();
        var list = viewModel.newsResponse?.articles ?? [];
        return ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
            height: 25,
          ),
          itemBuilder: (context, index) {
            return NewsItem(articles: list[index]);
          },
          itemCount: list.length ?? 0,
        );
      },
    );
  }
}
