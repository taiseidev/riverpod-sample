// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_sample/riverpod/data/models/tag.dart';
import 'package:riverpod_sample/riverpod/data/models/user.dart';

part 'qiita_post.freezed.dart';
part 'qiita_post.g.dart';

@freezed
abstract class QiitaPost with _$QiitaPost {
  factory QiitaPost({
    String? title,
    @JsonKey(name: 'likes_count') int? likesCount,
    @JsonKey(name: 'stocks_count') int? stocksCount,
    User? user,
    String? url,
    List<Tag>? tags,
  }) = _QiitaPost;

  factory QiitaPost.fromJson(Map<String, dynamic> json) =>
      _$QiitaPostFromJson(json);
}
