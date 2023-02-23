import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/riverpod/data/models/qiita_post.dart';
import 'package:riverpod_sample/riverpod/data/repository/posts_repository.dart';

final fetchQiitaPostsProvider =
    FutureProvider.family.autoDispose<List<QiitaPost>, String>(
  (ref, value) async {
    final posts =
        await ref.read(postsRepositoryProvider).fetchQiitaPosts(value);

    return posts.when(
      success: (value) => value,
      failure: (error) {
        throw DioError(
          requestOptions: RequestOptions(path: ''),
          error: error.response!.statusCode,
        );
      },
    );
  },
);
