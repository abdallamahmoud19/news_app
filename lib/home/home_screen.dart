import 'package:flutter/material.dart';
import 'package:news_app/home/category/category_details.dart';
import 'package:news_app/home/sources_tabs/news_tabs.dart';

import 'drawer/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(
        onBack: onBack,
      ),
      appBar: AppBar(
        title: const Text('General'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: selectedCategory == null
          ? CategoryDetails(
              onCategoryClick: clickedCategory,
            )
          : NewsTabs(
              categoryName: selectedCategory!,
              onTap: onBack,
            ),
    );
  }

  String? selectedCategory;

  clickedCategory(category) {
    selectedCategory = category;
    setState(() {});
  }

  onBack() {
    Navigator.pop(context);
    selectedCategory = null;
    setState(() {});
  }
}
