import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:softatechtask/Config/size.dart';
import 'package:softatechtask/Data/GetProductData.dart';
import 'package:softatechtask/Data/addCartItemdata.dart';
import 'package:softatechtask/Model/ProductDataModel.dart';
import 'package:softatechtask/Model/additemMode.dart';
import 'package:softatechtask/Screen/DetailScreen/Product_Detials.dart';
import 'package:favorite_button/favorite_button.dart';

class ProductScreen extends StatefulWidget {
  final ValueSetter <ProductDataModel>_valueSetter;
   ProductScreen(this._valueSetter);
   
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
    getproductmodel().then((value){
      
        setState(() {
       for(int i=0;i<value!.length;i++){
      productdatamodel!.add(value[i]);
         isproductdata =true; 
       }
     });

    });}
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
     
      body: isproductdata?GridView.builder(
          gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                   childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 1),
                  ),
                    itemCount: productdatamodel!.length,
                    itemBuilder: (context,index){
                      return Padding(
                        padding:  EdgeInsets.all(getHeight(context)*0.01),
                        child:  Container(
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
                           image: productdatamodel![index].getimage(),
                           name: productdatamodel![index].name,
                           descripation:productdatamodel![index].description,
                           rate:productdatamodel![index].retail_price,
                           title: productdatamodel![index].tag_name, 
                          tpe: productdatamodel![index].type)));
                        },
                        child: Container(
                          height: getHeight(context)*0.3,
                         
                          child: Image.network(productdatamodel![index].getimage().toString()),
                        ),
                      ),
                      SizedBox(
                        height: getHeight(context)*0.02,
                      ),
                      Text(productdatamodel![index].name.toString()),
                       SizedBox(
                        height: getHeight(context)*0.01,
                      ),
                      Text("Rs "+productdatamodel![index].retail_price.toString()+" /"),
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
                            child: GestureDetector(
                              onTap: ()async{
                                int userid =186;
                                int? productid =productdatamodel![index].id;
                                AddItem? addItem =await additembutton(userid.toString(), productid.toString());
                                   setState(() {
                                     _addItem =addItem;
                                   });
                                widget._valueSetter(productdatamodel![index]);
                                showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                
                  content: Text(productdatamodel![index].name.toString()+"  is Added"),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                      Navigator.pop(context);
                      },
                      child: Text("okay"),
                    ),
                  ],
                ),
              );
                              },
                              child: Container(
                                color: Colors.greenAccent,
                               child: Center(
                                 child: Text("Add To Bag"),
                               ),
                              ),
                            ),
                            
                          )
                         ],
                       ),
                     )
                    ],
                  ),
                ),
                
            
                     );
                    }     
    ):Center(child: CircularProgressIndicator(backgroundColor: Colors.green,),) );
  }
}