class ProductFilterModel {
  final int? page;
  final int? limit;
  final String? category;
  final String? supplier;
  final String? orderBy;
  final String? order;
  final bool? hideOutOfStock;
  final double? minPrice;
  final double? maxPrice;

  ProductFilterModel({
    this.page,
    this.limit,
    this.category,
    this.supplier,
    this.orderBy,
    this.order,
    this.hideOutOfStock,
    this.minPrice,
    this.maxPrice,
  });

  factory ProductFilterModel.fromJson(Map<String, dynamic> json) {
    return ProductFilterModel(
      page: json['page'],
      limit: json['limit'],
      category: json['category'],
      supplier: json['supplier'],
      orderBy: json['orderBy'],
      order: json['order'],
      hideOutOfStock: json['hideOutOfStock'],
      minPrice: json['minPrice'],
      maxPrice: json['maxPrice'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'limit': limit,
      'category': category,
      'supplier': supplier,
      'orderBy': orderBy,
      'order': order,
      'hideOutOfStock': hideOutOfStock,
      'minPrice': minPrice,
      'maxPrice': maxPrice,
    };
  }

  Map<String, dynamic> toQueryParameters() {
    final Map<String, dynamic> data = {
      'page': page,
      'limit': limit,
      'category': category,
      'supplier': supplier,
      'orderBy': orderBy,
      'order': order,
      'hideOutOfStock': hideOutOfStock,
      'minPrice': minPrice,
      'maxPrice': maxPrice,
    };

    data.removeWhere((key, value) => value == null || value == '');

    return data;
  }
}
