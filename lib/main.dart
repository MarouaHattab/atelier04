import 'package:atelier04/screens/ban_navigation.dart';
import 'package:atelier04/screens/home.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home :
    BarNavigationScreen(),
    debugShowCheckedModeBanner: false, );
  }
}