import 'package:atelier04/const/mes_images.dart';
import 'package:atelier04/my_Widgets/categories-widget.dart';
import 'package:flutter/material.dart';
import 'package:lecle_flutter_carousel_pro/lecle_flutter_carousel_pro.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Carousel widget with local images
            SizedBox(
              height: 200.0,
              width: MediaQuery.of(context).size.width,
              child: Carousel(
                images: [
                  AssetImage("assets/img/carousel1.png"),
                  AssetImage("assets/img/carousel2.jpeg"),
                  AssetImage("assets/img/carousel3.jpg"),
                  AssetImage("assets/img/carousel4.png"),
                ],
                dotSize: 4.0,
                dotSpacing: 15.0,
                dotColor: Colors.blueGrey,
                indicatorBgPadding: 5.0,
                dotBgColor: Colors.blue.withOpacity(0.5),
                hasBorderRadius: true,
              ),
            ),
            
            // "Catégories" container
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: Center(
                child: Text(
                  'Catégories',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            
            // Categories section - Fixed with a horizontally scrollable ListView
          Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
              MesImages.imagesCategories.length,
              (index) => CategoriesWidget(
                nameImage: MesImages.imagesCategories[index],
                textImage: MesImages.textImageCategories[index],
              ),
            ),
          ),
        ),
      ),
          Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              child: Center(
                child: Text(
                  'Marques',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            
            // Categories section - Fixed with a horizontally scrollable ListView
          Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
              MesImages.imagesCategories.length,
              (index) => CategoriesWidget(
                nameImage: MesImages.imagesCategories[index],
                textImage: MesImages.textImageCategories[index],
              ),
            ),
          ),
        ),
      ),
          ],
        ),
      ),
    );
  }
}