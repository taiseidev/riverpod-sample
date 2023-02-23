import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_sample/riverpod/data/models/tag.dart';
import 'package:riverpod_sample/riverpod/data/models/user.dart';

part 'qiita_post.freezed.dart';
part 'qiita_post.g.dart';

@freezed
abstract class QiitaPost with _$QiitaPost {
  factory QiitaPost({
    String? title,
    int? likesCount,
    int? stocksCount,
    User? user,
    String? url,
    List<Tag>? tags,
  }) = _QiitaPost;

  factory QiitaPost.fromJson(Map<String, dynamic> json) =>
      _$QiitaPostFromJson(json);
}
