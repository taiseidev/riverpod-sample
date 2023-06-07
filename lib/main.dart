import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/riverpod/app.dart';
import 'package:riverpod_sample/riverpod/data/remote/posts_data_source.dart';

final dataSourceProvider =
    Provider.autoDispose<PostsDataSource>((ref) => throw UnimplementedError());

void main() {
  runApp(
    ProviderScope(
      overrides: [
        dataSourceProvider
            .overrideWith((ref) => ref.watch(postsDataSourceProvider)),
      ],
      child: const QiitaApp(),
    ),
  );
}
