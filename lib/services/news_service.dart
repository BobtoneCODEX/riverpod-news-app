
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article.dart';

class NewsService {
  final String apiKey;

  NewsService({required this.apiKey});

  Future<List<Article>> fetchNews() async {
    final url = Uri.https(
      'newsapi.org',
      '/v2/top-headlines',
      {
        'country': 'us',
        'apiKey': apiKey,
      },
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final articlesJson = data['articles'] as List;

      return articlesJson
          .map((json) => Article.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load news: ${response.statusCode}');
    }
  }
}
