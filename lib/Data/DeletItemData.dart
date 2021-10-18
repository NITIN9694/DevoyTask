import 'package:http/http.dart'as http;
import 'package:softatechtask/Model/DeletitemModel.dart';

Future<DeletItem?>deletitembutton(String userid,String productid)async{
// ignore: unused_local_variable
var response= await http.post(Uri.http("namastesale.devoysoftech.com", "api/deleteWishList"),
body :{"user_id":userid,
     "product_id":productid,
}
);
var data= response.body;
print(data);
if(response.body ==200){
  String responseString =response.body;
 deletItemFromJson(responseString);
}
else{
  print("Data is not coming");
}
}