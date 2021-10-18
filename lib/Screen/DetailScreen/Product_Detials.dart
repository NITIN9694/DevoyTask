import 'package:flutter/material.dart';
import 'package:softatechtask/Config/size.dart';



class Product_Details extends StatefulWidget {
 String?image;
  String?name;
  String?descripation;
  int?rate;
  String?title;
  String? tpe;
  
   Product_Details({
        Key?key,
       @required this.image,
       @required this.name,
       @required this.descripation,
       @required this.rate,
       @required this.title,
        @required this.tpe,
      }):super(key: key);
  @override
  _Product_DetailsState createState() => _Product_DetailsState();
}

class _Product_DetailsState extends State<Product_Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.all(getHeight(context)*0.02),
        child: SingleChildScrollView(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
          padding:  EdgeInsets.all(getHeight(context)*0.02),
          child: Container(
            height: getHeight(context)*0.55,
           
           child: Image.network(widget.image.toString())
          ),
          
            ),
            SizedBox(
          height: getHeight(context)*0.02,
            ),
            Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(widget.name.toString(),  style: TextStyle(
              fontSize: getHeight(context)*0.024,
              fontWeight: FontWeight.bold
            ),),
            Text("Rs "+widget.rate.toString(),  style: TextStyle(
              fontSize: getHeight(context)*0.024,
              fontWeight: FontWeight.bold
            ),),
          ],
            ),
            SizedBox(
          height: getHeight(context)*0.02,
            ),
            Text("Type- "+widget.title.toString(),style: TextStyle(
              fontSize: getHeight(context)*0.018,
             color: Colors.grey
            ),),
            
            SizedBox(
          height: getHeight(context)*0.02,
            ),
            Container(
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
                       color: Colors.white
                       ,),
                      
             child : Center(child: Column(
                children: [
                   SizedBox(
          height: getHeight(context)*0.02,
            ),
                  Text("Descripation",  style: TextStyle(
                fontSize: getHeight(context)*0.024,
                fontWeight: FontWeight.bold
              ),),
                  Text(widget.descripation.toString(),
          style: TextStyle(
                    fontSize: getHeight(context)*0.02
                  ),),
                ],
              ),
              
              ),
            )
          ],
        ),
        ),
      ),
    );
  }
}