


import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:softatechtask/Config/size.dart';

import 'package:softatechtask/Model/CartModel.dart';
import 'package:softatechtask/Model/DeletitemModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:softatechtask/Provider/productdata.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {

 
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
 List<CartModel>? cartModel =[];
 final con= ScrollController();
  DeletItem ?_deletItem;
 @override
  void initState() {
    super.initState();
 final productData =Provider.of<ProductsProvider>(context,listen: false);
 productData.getprouctcart();

  }
  @override
   Widget build(BuildContext context) {
  final response = Provider.of<ProductsProvider>(context);
   log(response.toString());
    return  Scaffold(
      body:response.cartloding? Center(
        child: CircularProgressIndicator(),
      ):
           ListView.separated(itemBuilder: (context,index){
          return  Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: getHeight(context)*0.12,
                child: Image.network(response.cartmodel![index].getimage().toString())),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(response.cartmodel![index].product_name.toString(),style: TextStyle(
                    fontSize: getHeight(context)*0.02,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(
                    height: getHeight(context)*0.02,
                  ),
                   Text("Rs "+response.cartmodel![index].price.toString()+"/",style: TextStyle(
                    fontSize: getHeight(context)*0.02,
                    fontWeight: FontWeight.bold
                  ),),
      
                
                ],
              ),
              IconButton(onPressed: ()async{
             Fluttertoast.showToast(
                               msg: "Item is deleted",
                               textColor: Colors.white,
                               backgroundColor: Colors.greenAccent
                                );
             int userid =186;
             int ? productid =response.cartmodel![index].product_id;
            final _addbutton =await Provider.of<ProductsProvider>(context,listen: false).deletitembutton(186.toString(), 660.toString());
              setState(() {
                _deletItem = _addbutton;
               
                  });
                                
               
              }, icon:Icon(Icons.delete))
            ],
            ),
          );
           }, separatorBuilder: (context,index){
             return Divider();
           },
           controller: con,
            itemCount:response.cartmodel!.length,
           shrinkWrap: true,
           )
        
    );
  }
}