import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/bloc/cubit.dart';
import 'package:news_app/home/drawer/app_drawer.dart';
import 'package:news_app/home/news/news_details.dart';
import 'package:news_app/models/SourceResponse.dart';

import '../../bloc/states.dart';

class NewsTabs extends StatelessWidget {
  static const String routeName = 'category_details';
  String categoryName;
  Function onTap;

  NewsTabs({super.key, required this.categoryName, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getSources(categoryName),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var bloc = BlocProvider.of<HomeCubit>(context);
          var sources = bloc.sourceResponse?.sources ?? [];
          if (state is GetSourcesLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is GetSourcesErrorState
              ) {
            return Text("error");
          } else {
            return DefaultTabController(
              length: sources.length ?? 0,
              initialIndex: bloc.selectedIndex,
              child: Column(
                children: [
                  TabBar(
                    onTap: (value) {
                      bloc.changeSelectedIndex(value);
                    },
                    labelColor: Colors.black,
                    indicatorColor: Colors.black,
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    tabs: sources
                        .map(
                          (source) => Tab(
                            text: source.name,
                          ),
                        )
                        .toList(),
                  ),
                  Expanded(
                      child: NewsDetails(
                          sourceId: sources?[bloc.selectedIndex].id ?? ''))
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
