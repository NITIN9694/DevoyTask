import 'package:flutter/widgets.dart';

class CartModel{
  int? id;
  int ? user_id;
  int?product_id;
  int?retail_price;
  String?product_name;
  String?image;
  int?price;


  
  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'user_id': user_id,
      'product_id': product_id,
      'retail_price': retail_price,
      'image':image,
      'product_name': product_name,
      'price': price,
      

    };
  }
  CartModel ({
    @required this.id,
  @required this.product_id,
  @required this.image,
  @required this.user_id,
  @required this.retail_price,
  @required this.product_name,
  @required this.price
 
});


  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
       id: map['id'],
       product_id: map['product_id'],
       user_id: map['user_id'],
       image: map['image'],
       retail_price: map['retail_price'],
       product_name: map['product_name'],
       price: map['price'],
      
              
    );
  }
   String ? getimage(){
     
       return "http://namastesale.devoysoftech.com/webroot/img/upload/product_image/img"+image.toString();
     }

}