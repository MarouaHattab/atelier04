import 'package:atelier04/const/mes_images.dart';
import 'package:flutter/material.dart';

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
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            //width:double.infinity,
            color: Colors.black,
            child: 
            Center(
              child: Text('Catégories',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.4,
                      height: MediaQuery.of(context).size.width*0.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(MesImages.imagesCategories[0],fit: BoxFit.cover ,),
                          Text(MesImages.textImageCategories[0])
                        ],
                      )),
                    
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      
    );
  }
}