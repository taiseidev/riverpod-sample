import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_sample/riverpod/data/models/qiita_post.dart';
import 'package:riverpod_sample/riverpod/repository/posts_repository.dart';

part 'fetch_qiita_posts.g.dart';

@riverpod
Future<List<QiitaPost>> fetchQiitaPosts(
  FetchQiitaPostsRef ref, {
  required String tag,
  required int page,
}) async {
  final posts =
      await ref.read(postsRepositoryProvider).fetchQiitaPosts(tag, page);

  return posts.when(
    success: (value) => value,
    failure: (error) {
      throw DioError(
        requestOptions: RequestOptions(path: ''),
        error: error.response!.statusCode,
      );
    },
  );
}
