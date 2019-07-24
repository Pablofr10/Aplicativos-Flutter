import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData{

  String category;
  String id;

  String title;
  String description;

  double price;

  List images;
  List sizes;

  ProductData();

  ProductData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    print(snapshot.data);
    title = snapshot.data["title"];
    description = snapshot.data["description"];
    price = snapshot.data["price"] + 0.0;
    images = snapshot.data["images"];
    sizes = snapshot.data["sizes"];
  }

  Map<String, dynamic> toResumeMap(){
    return {
      "description": description,
      "price":price,
      "title": title,
    };
  }

}