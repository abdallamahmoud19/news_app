import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  Function onBack;

  AppDrawer({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFF171717),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24),
            bottomRight: Radius.circular(24),
          )),
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        children: [
          Container(
            height: 166,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(24),
                )),
            child: Text(
              "News App",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          InkWell(
            onTap: () {
              onBack();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Row(
                children: [
                  Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    "Go To Home",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Divider(
            color: Colors.white,
            endIndent: 40,
            indent: 40,
          )
        ],
      ),
    );
  }
}
