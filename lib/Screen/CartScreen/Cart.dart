

import 'package:flutter/material.dart';
import 'package:softatechtask/Config/size.dart';
import 'package:softatechtask/Data/DeletItemData.dart';
import 'package:softatechtask/Model/DeletitemModel.dart';


class Cart extends StatefulWidget {
 List cart;
 Cart(this.cart);
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  DeletItem ?_deletItem;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      body: Column(
        
       crossAxisAlignment: CrossAxisAlignment.start,
       children: <Widget>[
         SizedBox(
           height: getHeight(context)*0.02,
         ),
         ListView.separated(itemBuilder: (context,index){
        return  Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: getHeight(context)*0.12,
              child: Image.network(widget.cart[index].getimage().toString())),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.cart[index].name,style: TextStyle(
                  fontSize: getHeight(context)*0.02,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(
                  height: getHeight(context)*0.02,
                ),
                 Text("Rs "+widget.cart[index].retail_price.toString()+"/",style: TextStyle(
                  fontSize: getHeight(context)*0.02,
                  fontWeight: FontWeight.bold
                ),),
              ],
            ),
            IconButton(onPressed: ()async{
              int userid =186;
             int? productid =widget.cart[index].id;
             DeletItem ?deletitem =await deletitembutton(userid.toString(), productid.toString());
            setState(() {
              _deletItem =deletitem;
              widget.cart.removeAt(index);
                showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                
                  content: Text("Item is Deleted"),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Text("okay"),
                    ),
                  ],
                ),
              );
            });
            }, icon:Icon(Icons.delete))
          ],
          ),
        );
         }, separatorBuilder: (context,index){
           return Divider();
         }, itemCount:widget.cart.length,
         shrinkWrap: true,
         )
       ],
      ),
    );
  }
}