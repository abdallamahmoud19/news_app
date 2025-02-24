import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem({super.key, required this.imageName, required this.isRight});
  String imageName;
  bool isRight;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: isRight ? Alignment.bottomRight : Alignment.bottomLeft,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset("assets/images/${imageName}.png")),
        Padding(
          padding: const EdgeInsets.only(bottom: 16, right: 16),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(.50),
                borderRadius: BorderRadius.circular(35)),
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'View all',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 35,
                    child: IconButton(
                        onPressed: () {}, icon: Icon(Icons.arrow_forward_ios)),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
