import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/riverpod/app.dart';
import 'package:riverpod_sample/riverpod/data/local/stub_posts_data_source.dart';
import 'package:riverpod_sample/riverpod/data/remote/posts_data_source.dart';
import 'package:riverpod_sample/riverpod/data/repository/posts_repository.dart';

void main() {
  runApp(
    ProviderScope(
      overrides: [
        dataSourceProvider
            .overrideWith(((ref) => ref.watch(postsDataSourceProvider))),
      ],
      child: const QiitaApp(),
    ),
  );
}
