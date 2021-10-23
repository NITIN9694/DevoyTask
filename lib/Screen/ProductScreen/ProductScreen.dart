
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:softatechtask/Config/size.dart';
import 'package:softatechtask/Model/ProductDataModel.dart';
import 'package:softatechtask/Model/additemMode.dart';
import 'package:softatechtask/Provider/productdata.dart';
import 'package:softatechtask/Screen/DetailScreen/Product_Detials.dart';
import 'package:provider/provider.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ProductScreen extends StatefulWidget {

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
   List <ProductDataModel>? productdatamodel=[];
   bool isproductdata =false;
   bool islike=false;
   AddItem? _addItem;
   @override
  void initState() {
    super.initState();
 final productData =Provider.of<ProductsProvider>(context,listen: false);
 productData.getdataproduct(context);

  }

  @override
  Widget build(BuildContext context) {
    final response = Provider.of<ProductsProvider>(context);
   
  return Scaffold(
      body:
      response.loding?Center(
        child: CircularProgressIndicator(),
      ):
      
       GridView.builder(
          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                   childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1),
                  ),
                    itemCount:response. productdatamodel!.length,
                    itemBuilder: (context,index){
                      // var data =response. productdatamodel![index];
                    return Padding(
                    padding:  EdgeInsets.all(getHeight(context)*0.01),
                  child: 
                  GridTile(
                 
                    child: Container(
                    height: getHeight(context)*0.2,
                    width: getWidth(context)*0.95,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(05),
                         boxShadow: [
                         BoxShadow(
                         color: Colors.black.withOpacity(0.1),
                          offset: const Offset(
                                  5.0,
                                  5.0,
                                ),
                         blurRadius: 10.0,
                         spreadRadius: 2.0,),],
                         color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>Product_Details(
                      name: response.productdatamodel![index].name,
                      image: response.productdatamodel![index].getimage(),
                      desricpation: response.productdatamodel![index].description,
                      price: response.productdatamodel![index].retail_price,
                      type: response.productdatamodel![index].type,
                      )));
                          },
                          child: Container(
                            height: getHeight(context)*0.3,
                           
                            child: Image.network( response.productdatamodel![index].getimage().toString()),
                          ),
                        ),
                        SizedBox(
                          height: getHeight(context)*0.02,
                        ),
                        Text(response.productdatamodel![index].name.toString()),
                         SizedBox(
                          height: getHeight(context)*0.01,
                        ),
                        Text("Rs "+response.productdatamodel![index].retail_price.toString()+" /"),
                         SizedBox(
                          height: getHeight(context)*0.02,
                        ),
                         Expanded(
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             FavoriteButton(
                            isFavorite: false,
                         iconDisabledColor: Colors.grey,
                         valueChanged: (_isFavourite) {
                        
                               },
                           ),
                            SizedBox(
                              width: getWidth(context)*0.05,
                            ),
                            Expanded(
                              child:  GestureDetector(
                                  onTap: ()async{
                            Fluttertoast.showToast(
                               msg: "Item is added",
                               textColor: Colors.white,
                               backgroundColor: Colors.black
                                );
                                    int userid =186;
                                    int ? productid =response.productdatamodel![index].id;
                                    log(productid.toString());
                                    final _addbutton =await Provider.of<ProductsProvider>(context,listen: false).additembutton(userid.toString(), productid.toString());
                                    setState(() {
                                      _addItem = _addbutton;
                                    });
                              
                                   },
                                  child: Container(
                                    color: Colors.greenAccent,
                                   child: Center(
                                     child: Text("Add To Bag"),
                                   ),
                                  ),
                                ),
                              ),
                              
                            
                           ],
                         ),
                       )
                      ],
                    ),
                                  ),
                  ),
                
    );
                     
                    }     
    ));
  
  }
}