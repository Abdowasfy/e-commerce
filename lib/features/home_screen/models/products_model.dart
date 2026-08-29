class ProductsModel {
  final int id;
  final String title;
  final String slug;
  final int price;
  final String description;
  final Category category;
  final List<String> images;
  final DateTime creationAt;
  final DateTime updatedAt;

  ProductsModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
    required this.creationAt,
    required this.updatedAt,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'] as int,
      title: json['title'] as String,
      slug: json['slug'] as String,
      price: json['price'] as int,
      description: json['description'] as String,

      category: Category.fromJson(
        json['category'] as Map<String, dynamic>,
      ),

      images: (json['images'] as List<dynamic>? ?? [])
          .map((image) => image.toString())
          .toList(),

      creationAt: DateTime.parse(json['creationAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'slug': slug,
      'price': price,
      'description': description,
      'category': category.toJson(),
      'images': images,
      'creationAt': creationAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

class Category {
  final int id;
  final String name;
  final String slug;
  final String image;
  final DateTime creationAt;
  final DateTime updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.creationAt,
    required this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as int,
      name: json['name'] as String,
      slug: json['slug'] as String,
      image: json['image'] as String,
      creationAt: DateTime.parse(json['creationAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'image': image,
      'creationAt': creationAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}