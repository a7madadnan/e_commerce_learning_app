



  class ProductModel {
  final String name;
  final int numOfTimesOrdered;
  final int totalUnitsOrdered;
  final int numOfReviews;
  final String averageRating;
  final String description;
  final String price;
  final int stock;
  final String categoryName;
  final String supplierName;
  final String thumbnail;
  ProductModel({
    required this.name,
    required this.numOfTimesOrdered,
    required this.totalUnitsOrdered,
    required this.numOfReviews,
    required this.averageRating,
    required this.description,
    required this.price,
    required this.stock,
    required this.categoryName,
    required this.supplierName,
    required this.thumbnail,});

  Map<String, dynamic> toJson() {
    return 
    
    {
      'name': name,
        'numOfTimesOrdered': numOfTimesOrdered,
        'totalUnitsOrdered': totalUnitsOrdered,
        'numOfReviews': numOfReviews,
        'averageRating': averageRating,
        'description': description,
        'price': price,
        'stock': stock,
        'categoryName': categoryName,
        'supplierName': supplierName,
        'thumbnail': thumbnail,
    };
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    name: json['name'],
    numOfTimesOrdered: json['numOfTimesOrdered'],
    totalUnitsOrdered: json['totalUnitsOrdered'],
    numOfReviews: json['numOfReviews'],
    averageRating: json['averageRating'],
    description: json['description'],
    price: json['price'],
    stock: json['stock'],
    categoryName: json['categoryName'],
    supplierName: json['supplierName'],
    thumbnail: json['thumbnail'],
  );
}
