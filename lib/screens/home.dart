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
        title: Center(child: Text('Home Page',style: TextStyle(color: Colors.white),)),
        backgroundColor: Colors.pinkAccent,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Carousel section with title and improved styling
            Container(
              margin: EdgeInsets.only(top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    height: 200.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Carousel(
                        images: [
                          AssetImage("assets/img/carousel1.png"),
                          AssetImage("assets/img/carousel2.jpeg"),
                          AssetImage("assets/img/carousel3.jpg"),
                          AssetImage("assets/img/carousel4.png"),
                        ],
                        dotSize: 5.0,
                        dotSpacing: 18.0,
                        dotColor: Colors.white.withOpacity(0.7),
                        indicatorBgPadding: 8.0,
                        dotBgColor: Colors.black.withOpacity(0.4),
                        hasBorderRadius: true,
                        radius: Radius.circular(8.0),
                        overlayShadow: true,
                        overlayShadowColors: Colors.black.withOpacity(0.2),
                        overlayShadowSize: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            //SizedBox(height: 16), // Added space before Categories
            
            // "Catégories" container
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Center(
                child: Text(
                  'Catégories',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            
            // Categories section - Fixed with a horizontally scrollable ListView
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                    MesImages.imagesCategories.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: CategoriesWidget(
                        nameImage: MesImages.imagesCategories[index],
                        textImage: MesImages.textImageCategories[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            
            SizedBox(height: 16), // Added space before Marques
            
            Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.black,
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Center(
                child: Text(
                  'Marques',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            
            // Marques section - Fixed with a horizontally scrollable ListView
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(
                    MesImages.imagesMarques.length,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: CategoriesWidget(
                        nameImage: MesImages.imagesMarques[index],
                        textImage: MesImages.textImagesMarques[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            
            SizedBox(height: 16), // Added space at the bottom
          ],
        ),
      ),
    );
  }
}