
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/news_provider.dart';

class NewsScreen extends ConsumerWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsAsync = ref.watch(newsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod News'),
        centerTitle: true,
      ),
      body: newsAsync.when(
        data: (articles) {
          if (articles.isEmpty) {
            return const Center(
              child: Text('No news available'),
            );
          }

          return ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];

              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title: Text(article.title),
                  subtitle: Text(article.description),
                  leading: article.imageUrl.isNotEmpty
                      ? Image.network(
                          article.imageUrl,
                          width: 80,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.article);
                          },
                        )
                      : const Icon(Icons.article),
                ),
              );
            },
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) {
          return Center(
            child: Text('Something went wrong: $error'),
          );
        },
      ),
    );
  }
}
