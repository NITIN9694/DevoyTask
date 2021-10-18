import 'package:flutter/widgets.dart';

class ProductDataModel{
  int? id;
  String ? name;
  String?description;
  int?retail_price;
  String?image;
  String?tag_name;
  String?type;


  
  Map<String, dynamic> toMap() {
    return {
      'id':id,
      'name': name,
      'description': description,
      'retail_price': retail_price,
      'image':image,
      'tag_name': tag_name,
      'type': type,
      

    };
  }
  ProductDataModel ({
    @required this.id,
  @required this.description,
  @required this.image,
  @required this.name,
  @required this.retail_price,
  @required this.tag_name,
  @required this.type,
 
});


  factory ProductDataModel.fromMap(Map<String, dynamic> map) {
    return ProductDataModel(
       id: map['id'],
       name: map['name'],
       description: map['description'],
       image: map['image'],
       retail_price: map['retail_price'],
       tag_name: map['tag_name'],
       type: map['type'],
      
              
    );
  }
   String ? getimage(){
     
       return "http://namastesale.devoysoftech.com/webroot/img/upload/product_image/img"+image.toString();
     }

}