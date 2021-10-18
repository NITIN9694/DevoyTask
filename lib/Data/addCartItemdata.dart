import 'package:http/http.dart'as http;
import 'package:softatechtask/Model/additemMode.dart';
Future<AddItem?>additembutton(String userid,String productid)async{
// ignore: unused_local_variable

var response= await http.post(Uri.parse('http://namastesale.devoysoftech.com/api/addToWishList'),
body :{
      "user_id":userid,
     "product_id":productid,
}
);
var data= response.body;
print(data);
if(response.body ==200){
  String responseString =response.body;
 addcartitemFromJson(responseString);
}
else{
  print("Data is not coming");
}
}