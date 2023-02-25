import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/main.dart';
import 'package:riverpod_sample/riverpod/repository/i_posts_data_source.dart';
import 'package:riverpod_sample/riverpod/data/models/qiita_post.dart';
import 'package:riverpod_sample/riverpod/data/models/result.dart';

final postsRepositoryProvider = Provider.autoDispose(
  (ref) => PostsRepository(ref.watch(dataSourceProvider)),
);

class PostsRepository {
  PostsRepository(this._dataSource);

  final IPostsDataSource _dataSource;

  Future<Result<List<QiitaPost>>> fetchQiitaPosts(String tag, int page) {
    return _dataSource
        .getQiitaPosts(tag, page)
        .then((articles) => Result<List<QiitaPost>>.success(articles))
        .catchError((error) => Result<List<QiitaPost>>.failure(error));
  }
}
