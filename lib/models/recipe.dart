class Recipe {

  final String title;
  final String category;
  final String url;
  final String img;
  final String source;

//<editor-fold desc="Data Methods">

  const Recipe({
    required this.title,
    required this.category,
    required this.url,
    required this.img,
    required this.source,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Recipe &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          category == other.category &&
          url == other.url &&
          img == other.img &&
          source == other.source);

  @override
  int get hashCode =>
      title.hashCode ^
      category.hashCode ^
      url.hashCode ^
      img.hashCode ^
      source.hashCode;

  @override
  String toString() {
    return 'Recipe{' +
        ' title: $title,' +
        ' category: $category,' +
        ' url: $url,' +
        ' img: $img,' +
        ' source: $source,' +
        '}';
  }

  Recipe copyWith({
    String? title,
    String? category,
    String? url,
    String? img,
    String? source,
  }) {
    return Recipe(
      title: title ?? this.title,
      category: category ?? this.category,
      url: url ?? this.url,
      img: img ?? this.img,
      source: source ?? this.source,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'category': category,
      'url': url,
      'img': img,
      'source': source,
    };
  }

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      title: json['title'] as String,
      category: json['category'] as String,
      url: json['url'] as String,
      img: json['img'] as String,
      source: json['source'] as String,
    );
  }

//</editor-fold>
}