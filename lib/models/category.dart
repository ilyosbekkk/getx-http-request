class Category {

  final String category;

//<editor-fold desc="Data Methods">

  const Category({
    required this.category,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          runtimeType == other.runtimeType &&
          category == other.category);

  @override
  int get hashCode => category.hashCode;

  @override
  String toString() {
    return 'Category{' + ' category: $category,' + '}';
  }

  Category copyWith({
    String? category,
  }) {
    return Category(
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category,
    };
  }

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      category: json['category'] as String,
    );
  }

//</editor-fold>
}