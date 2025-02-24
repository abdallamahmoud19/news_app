import 'package:flutter/material.dart';
import 'package:news_app/home/category/category_item.dart';

class CategoryDetails extends StatelessWidget {
  CategoryDetails({super.key, required this.onCategoryClick});
  List<String> categories = [
    'general',
    'business',
    'entertainment',
    'technology',
    'science',
    'health',
    'sports',
  ];
  Function onCategoryClick;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Good Morning\nHere is Some News For You",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 12,
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 12,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    onCategoryClick(categories[index]);
                  },
                  child: CategoryItem(
                      imageName: categories[index], isRight: index.isEven),
                );
              },
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}
