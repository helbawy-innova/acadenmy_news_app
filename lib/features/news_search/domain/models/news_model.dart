

class NewsModel{
  final String title;
  final String description;
  final String imageUrl;

  NewsModel({
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json['title']??"No Title",
      description: json['description']??"No Description",
      imageUrl: json['urlToImage']??"https://via.placeholder.com/100",
    );
  }
}