
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/article.dart';
import '../services/news_service.dart';

// 1. Provide the API key
final apiKeyProvider = Provider<String>((ref) {
  return 'b524a146e14140b89e3b75af9a8be246';
});

// 2. Inject NewsService
final newsServiceProvider = Provider<NewsService>((ref) {
  final apiKey = ref.watch(apiKeyProvider);

  return NewsService(apiKey: apiKey);
});

// 3. Fetch news and manage its state
final newsProvider = FutureProvider<List<Article>>((ref) {
  final newsService = ref.watch(newsServiceProvider);

  return newsService.fetchNews();
});
