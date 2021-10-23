import 'dart:developer';

import 'package:flutter/cupertino.dart';

import 'package:softatechtask/Model/CartModel.dart';
import 'package:softatechtask/Model/DeletitemModel.dart';
import 'package:softatechtask/Model/ProductDataModel.dart';
import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:softatechtask/Model/additemMode.dart';

class ProductsProvider with ChangeNotifier{
 
 List <ProductDataModel>? productdatamodel=[];
 bool loding =false;
 bool cartloding =false;
 List<CartModel>? cartmodel =[];

  ProductDataModel findById(String id) {
    // ignore: unrelated_type_equality_checks
    return productdatamodel!.firstWhere((prod) => prod.id == id);
  }

  

Future <List<ProductDataModel>?> getdataproduct(context)async{
  loding= true;
  Uri url =Uri.parse("http://namastesale.devoysoftech.com/api/getAllProduct");
  final response = await http.get(url);
Map<String, dynamic> _map =json.decode(response.body);
    List _result= _map["data"];
   
    productdatamodel =_result.map((jsonData) =>ProductDataModel.fromMap(jsonData) ).toList();
   
    loding = false;
      notifyListeners();
} 

Future<AddItem?>additembutton(String userid,String productid)async{
// ignore: unused_local_variable

var response= await http.post(Uri.parse('http://namastesale.devoysoftech.com/api/addToWishList'),
body :{
      "user_id":userid,
     "product_id":productid,
}
);
var data= response.body;

 String responseString =response.body;
 addcartitemFromJson(responseString);
 notifyListeners();
}


Future<DeletItem?>deletitembutton(String userid,String productid)async{
// ignore: unused_local_variable
var response= await http.post(Uri.http("namastesale.devoysoftech.com", "api/deleteWishList"),
body :{
    "user_id":userid,
     "product_id":productid,
}
);
var data= response.body;
print(data);
String responseString =response.body;
 deletItemFromJson(responseString);
 notifyListeners();
}

Future<CartModel?>getprouctcart()async{
// ignore: unused_local_variable
cartloding= true;
var response= await http.post(Uri.http("namastesale.devoysoftech.com", "api/getWishListInfo"),
body :{
  "user_id":186.toString()
}
);

Map<String, dynamic> _map=json.decode(response.body);
var data= response.body;
List _result= _map["data"]["wishlist_info"];
  
   cartmodel =_result.map((jsonData) =>CartModel.fromMap(jsonData) ).toList();
    cartloding = false;
      notifyListeners();
}

deletitem(int index){
  productdatamodel!.removeAt(index);

  notifyListeners();
}
} 




