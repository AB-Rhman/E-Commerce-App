// class ProductModel {
//   String? name;
//   String? description;
//   String? image;
//   int? price;
//   int? oldPrice;
//   int? id;
//   int? discount;
//
//   ProductModel.fromJson({required Map<String, dynamic> data}) {
//     id = data['id'].toInt;
//     price = data['price'].toInt;
//     oldPrice = data['old_price'].toInt;
//     discount = data['discount'].toInt;
//     name = data['name'].toString();
//     description = data['description'].toString();
//     image = data['image'].toString();
//   }
// }


class ProductModel{
  String? name;
  String? description;
  String? image;
  int? price;
  int? oldPrice;
  int? id;
  int? discount;

  // Named constructor | refactoring
  ProductModel.fromJson({required Map<String,dynamic> data})
  {
    id = data['id'].toInt();
    description = data['description'].toString();
    name = data['name'].toString();
    image = data['image'].toString();
    price = data['price'].toInt();
    oldPrice = data['old_price'].toInt();
    discount = data['discount'].toInt();
  }
}