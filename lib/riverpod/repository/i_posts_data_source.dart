import 'package:riverpod_sample/riverpod/data/models/qiita_post.dart';

abstract class IPostsDataSource {
  Future<List<QiitaPost>> getQiitaPosts(String tag);
}
