import 'dart:async';

import 'package:flutter/material.dart';
import 'package:softatechtask/Controller/imageController.dart';
import 'package:softatechtask/Screen/MainScreen.dart';


class SplasScreen extends StatefulWidget {
  const SplasScreen({ Key? key }) : super(key: key);

  @override
  _SplasScreenState createState() => _SplasScreenState();
}

class _SplasScreenState extends State<SplasScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds:3),
    ()=>Navigator.pushReplacement(context,
    MaterialPageRoute(builder: (context) =>MainScreen())));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Center(
      child: Image.asset(ImageController.splashimage,fit:BoxFit.cover),
      ),
    );
  }
}