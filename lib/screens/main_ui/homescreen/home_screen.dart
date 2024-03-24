
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState()  => _HomeScreen();

}
class _HomeScreen extends State<HomeScreen>{
  @override
  Widget build(BuildContext context) {
   return const Scaffold(
     body: Center(child: Text("HOME SCREEN"),),
   );
  }
}
