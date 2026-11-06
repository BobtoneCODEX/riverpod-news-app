
class Article {
  final String title;
  final String description;
  final String imageUrl;
  final String url;

  const Article({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.url,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? 'No title',
      description: json['description'] ?? 'No description available',
      imageUrl: json['urlToImage'] ?? '',
      url: json['url'] ?? '',
    );
  }
}
