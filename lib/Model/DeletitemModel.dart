import 'dart:convert';



class DeletItem {
    DeletItem({
        required this.userId,
        required this.productId,
    });

    String userId;
    String productId;

    factory DeletItem.fromJson(Map<String, dynamic> json) => DeletItem(
        userId: json["user_id"],
        productId: json["product_id"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "product_id": productId,
    };
}
DeletItem deletItemFromJson(String str) => DeletItem.fromJson(json.decode(str));

String addToJson(DeletItem data) => json.encode(data.toJson());