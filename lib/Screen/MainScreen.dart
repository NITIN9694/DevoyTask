import 'package:flutter/material.dart';
import 'package:softatechtask/Model/ProductDataModel.dart';
import 'package:softatechtask/Screen/CartScreen/Cart.dart';

import 'package:softatechtask/Screen/ProductScreen/ProductScreen.dart';



class MainScreen extends StatefulWidget {
  const MainScreen({ Key? key }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<ProductDataModel> cart =[];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 2,
      child: Scaffold(
         drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Center(child: Text("Shop")),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart(cart)));
            },
         icon: Icon(Icons.shopping_bag))
        ],
        bottom:TabBar(
     tabs:<Widget> [
           Tab(text: "Products",),
           Tab(text: "Cart",),
          ], 
        ) ,
       ), 
        body: TabBarView(children: <Widget>[
                ProductScreen((selectedProduct){
                  cart.add(selectedProduct);
                }),
                Cart(cart),
        ],)
        
      ),
    );
  }
}