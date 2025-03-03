import 'package:atelier04/const/mes_images.dart';
import 'package:flutter/material.dart';

class CategoriesWidget extends StatelessWidget {
  String nameImage = "";
  String textImage = "";
  CategoriesWidget({
    super.key,
    required this.nameImage,
    required this.textImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.width * 0.2,
          child: GestureDetector(
            child: Image.asset(
              nameImage,
              fit: BoxFit.fill,
            ),
            onTap: () {
              print("Image clicked");
            },
          ),
        ),
        Text(textImage)
      ],
    );
  }
}
