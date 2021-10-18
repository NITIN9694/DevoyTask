import 'dart:convert';



class AddItem {
    AddItem({
        required this.userId,
        required this.productId,
    });

    int userId;
    int productId;

    factory AddItem.fromJson(Map<String, dynamic> json) => AddItem(
        userId: json["user_id"],
        productId: json["product_id"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "product_id": productId,
    };
}
AddItem addcartitemFromJson(String str) => AddItem.fromJson(json.decode(str));

String addToJson(AddItem data) => json.encode(data.toJson());
