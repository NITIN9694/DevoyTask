import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:softatechtask/Model/ProductDataModel.dart';

Future <List<ProductDataModel>?> getproductmodel()async{
  Uri url =Uri.parse("http://namastesale.devoysoftech.com/api/getAllProduct");
  final response = await http.get(url);
  if(response.statusCode ==200){
  Map<String, dynamic> _map =json.decode(response.body);
    List _result= _map["data"];
    List<ProductDataModel> _getproduct =_result.map((jsonData) =>ProductDataModel.fromMap(jsonData) ).toList();
    return _getproduct;
  }else{
    print("Api is not valied");
  }
} 