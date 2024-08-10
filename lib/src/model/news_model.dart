



class NewsModel {
  final String id;
  final String imageUrl;
  final String title;

  NewsModel({
    required this.id,
    required this.imageUrl,
    required this.title,
  });

  // Factory constructor to create an instance from JSON
  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'],
      imageUrl: json['image_url'],
      title: json['title'],
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image_url': imageUrl,
      'title': title,
    };
  }
}
