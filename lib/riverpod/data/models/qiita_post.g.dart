// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qiita_post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QiitaPost _$$_QiitaPostFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$_QiitaPost',
      json,
      ($checkedConvert) {
        final val = _$_QiitaPost(
          title: $checkedConvert('title', (v) => v as String?),
          likesCount: $checkedConvert('likes_count', (v) => v as int?),
          stocksCount: $checkedConvert('stocks_count', (v) => v as int?),
          user: $checkedConvert(
              'user',
              (v) =>
                  v == null ? null : User.fromJson(v as Map<String, dynamic>)),
          url: $checkedConvert('url', (v) => v as String?),
          tags: $checkedConvert(
              'tags',
              (v) => (v as List<dynamic>?)
                  ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
                  .toList()),
        );
        return val;
      },
      fieldKeyMap: const {
        'likesCount': 'likes_count',
        'stocksCount': 'stocks_count'
      },
    );

Map<String, dynamic> _$$_QiitaPostToJson(_$_QiitaPost instance) =>
    <String, dynamic>{
      'title': instance.title,
      'likes_count': instance.likesCount,
      'stocks_count': instance.stocksCount,
      'user': instance.user,
      'url': instance.url,
      'tags': instance.tags,
    };
