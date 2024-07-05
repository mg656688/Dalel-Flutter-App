class HistoricalPlacesModel {
  final String id;
  final String name;
  final String description;
  final String image;
  final List<String> keywords;

  HistoricalPlacesModel({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.keywords,
  });

  factory HistoricalPlacesModel.fromJson(Map<String, dynamic> json) {
    return HistoricalPlacesModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      keywords: List<String>.from(json['keywords'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'keywords': keywords,
    };
  }
}
