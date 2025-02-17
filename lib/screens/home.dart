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
            width: MediaQuery.of(context).size.width*0.2,
            //width:double.infinity,
            color: Colors.black,
            child: 
            Center(
              child: Text('Catégories',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              ),
            ),
          )
        ],
      ),
      
    );
  }
}