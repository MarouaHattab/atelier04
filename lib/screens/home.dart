import 'package:atelier04/const/mes_images.dart';
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
                dotBgColor: Colors.pinkAccent.withOpacity(0.5),
                hasBorderRadius: true,
              ),
              
            ),
            SizedBox(height: 10.0),
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
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            // All Categories in a grid
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: MesImages.imagesCategories.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(10)),
                            child: Image.asset(
                              MesImages.imagesCategories[index],
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            MesImages.textImageCategories[index],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
