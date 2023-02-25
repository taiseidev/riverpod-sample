import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/riverpod/repository/i_posts_data_source.dart';
import 'package:riverpod_sample/riverpod/data/models/qiita_post.dart';

final stubPostsDataSourceProvider = Provider<StubPostsDataSource>((ref) {
  return StubPostsDataSource();
});

class StubPostsDataSource implements IPostsDataSource {
  @override
  Future<List<QiitaPost>> getQiitaPosts(String tag, int page) async {
    final content =
        json.decode(await rootBundle.loadString('assets/stub/stub_data.json'))
            as Iterable;
    return content.map((e) => QiitaPost.fromJson(e)).toList();
  }
}
