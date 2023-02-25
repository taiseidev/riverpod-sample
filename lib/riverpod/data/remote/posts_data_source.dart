import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_sample/riverpod/repository/i_posts_data_source.dart';
import 'package:riverpod_sample/riverpod/data/models/qiita_post.dart';
import 'package:riverpod_sample/riverpod/data/remote/app_dio.dart';

part 'posts_data_source.g.dart';

final postsDataSourceProvider = Provider.autoDispose<PostsDataSource>((ref) {
  return PostsDataSource(
    ref.watch(dioProvider),
  );
});

@RestApi(baseUrl: "https://qiita.com/api/v2")
abstract class PostsDataSource implements IPostsDataSource {
  factory PostsDataSource(Dio dio, {String baseUrl}) = _PostsDataSource;

  @override
  @GET("/tags/{tag}/items")
  Future<List<QiitaPost>> getQiitaPosts(
    @Path("tag") String tag,
    @Query("page") int page,
  );
}
