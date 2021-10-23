import 'package:flutter/material.dart';
import 'package:softatechtask/Provider/productdata.dart';
import 'package:softatechtask/Screen/DetailScreen/Product_Detials.dart';
import 'package:softatechtask/Screen/ProductScreen/ProductScreen.dart';
import 'package:softatechtask/Screen/SplashScreen.dart';

import 'package:provider/provider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx)=>ProductsProvider(),
      child: MaterialApp(
       home: SplasScreen(),
       routes: {
         
       },
      ),
    );
  }
}

