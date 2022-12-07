import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/riverpod/data/i_posts_data_source.dart';
import 'package:riverpod_sample/riverpod/data/models/qiita_post.dart';
import 'package:riverpod_sample/riverpod/data/models/result.dart';
import 'package:riverpod_sample/riverpod/data/remote/posts_data_source.dart';

final postsRepositoryProvider =
    Provider((ref) => PostsRepository(ref.watch(dataSourceProvider)));

final dataSourceProvider =
    Provider<IPostsDataSource>((ref) => throw UnimplementedError());

class PostsRepository {
  PostsRepository(this._dataSource);

  final IPostsDataSource _dataSource;

  static const defaultPostCount = 50;

  @override
  Future<Result<List<QiitaPost>>> getQiitaPosts(
    String tag,
    int defaultPostCount,
  ) {
    return _dataSource
        .getQiitaPosts(tag, defaultPostCount)
        .then((articles) => Result<List<QiitaPost>>.success(articles))
        .catchError((error) => Result<List<QiitaPost>>.failure(error));
  }
}
