// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'qiita_post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

QiitaPost _$QiitaPostFromJson(Map<String, dynamic> json) {
  return _QiitaPost.fromJson(json);
}

/// @nodoc
mixin _$QiitaPost {
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'likes_count')
  int? get likesCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'stocks_count')
  int? get stocksCount => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  List<Tag>? get tags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QiitaPostCopyWith<QiitaPost> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QiitaPostCopyWith<$Res> {
  factory $QiitaPostCopyWith(QiitaPost value, $Res Function(QiitaPost) then) =
      _$QiitaPostCopyWithImpl<$Res, QiitaPost>;
  @useResult
  $Res call(
      {String? title,
      @JsonKey(name: 'likes_count') int? likesCount,
      @JsonKey(name: 'stocks_count') int? stocksCount,
      User? user,
      String? url,
      List<Tag>? tags});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$QiitaPostCopyWithImpl<$Res, $Val extends QiitaPost>
    implements $QiitaPostCopyWith<$Res> {
  _$QiitaPostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? likesCount = freezed,
    Object? stocksCount = freezed,
    Object? user = freezed,
    Object? url = freezed,
    Object? tags = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      likesCount: freezed == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      stocksCount: freezed == stocksCount
          ? _value.stocksCount
          : stocksCount // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_QiitaPostCopyWith<$Res> implements $QiitaPostCopyWith<$Res> {
  factory _$$_QiitaPostCopyWith(
          _$_QiitaPost value, $Res Function(_$_QiitaPost) then) =
      __$$_QiitaPostCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      @JsonKey(name: 'likes_count') int? likesCount,
      @JsonKey(name: 'stocks_count') int? stocksCount,
      User? user,
      String? url,
      List<Tag>? tags});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_QiitaPostCopyWithImpl<$Res>
    extends _$QiitaPostCopyWithImpl<$Res, _$_QiitaPost>
    implements _$$_QiitaPostCopyWith<$Res> {
  __$$_QiitaPostCopyWithImpl(
      _$_QiitaPost _value, $Res Function(_$_QiitaPost) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? likesCount = freezed,
    Object? stocksCount = freezed,
    Object? user = freezed,
    Object? url = freezed,
    Object? tags = freezed,
  }) {
    return _then(_$_QiitaPost(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      likesCount: freezed == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      stocksCount: freezed == stocksCount
          ? _value.stocksCount
          : stocksCount // ignore: cast_nullable_to_non_nullable
              as int?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<Tag>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_QiitaPost implements _QiitaPost {
  _$_QiitaPost(
      {this.title,
      @JsonKey(name: 'likes_count') this.likesCount,
      @JsonKey(name: 'stocks_count') this.stocksCount,
      this.user,
      this.url,
      final List<Tag>? tags})
      : _tags = tags;

  factory _$_QiitaPost.fromJson(Map<String, dynamic> json) =>
      _$$_QiitaPostFromJson(json);

  @override
  final String? title;
  @override
  @JsonKey(name: 'likes_count')
  final int? likesCount;
  @override
  @JsonKey(name: 'stocks_count')
  final int? stocksCount;
  @override
  final User? user;
  @override
  final String? url;
  final List<Tag>? _tags;
  @override
  List<Tag>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'QiitaPost(title: $title, likesCount: $likesCount, stocksCount: $stocksCount, user: $user, url: $url, tags: $tags)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QiitaPost &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            (identical(other.stocksCount, stocksCount) ||
                other.stocksCount == stocksCount) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, likesCount, stocksCount,
      user, url, const DeepCollectionEquality().hash(_tags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_QiitaPostCopyWith<_$_QiitaPost> get copyWith =>
      __$$_QiitaPostCopyWithImpl<_$_QiitaPost>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_QiitaPostToJson(
      this,
    );
  }
}

abstract class _QiitaPost implements QiitaPost {
  factory _QiitaPost(
      {final String? title,
      @JsonKey(name: 'likes_count') final int? likesCount,
      @JsonKey(name: 'stocks_count') final int? stocksCount,
      final User? user,
      final String? url,
      final List<Tag>? tags}) = _$_QiitaPost;

  factory _QiitaPost.fromJson(Map<String, dynamic> json) =
      _$_QiitaPost.fromJson;

  @override
  String? get title;
  @override
  @JsonKey(name: 'likes_count')
  int? get likesCount;
  @override
  @JsonKey(name: 'stocks_count')
  int? get stocksCount;
  @override
  User? get user;
  @override
  String? get url;
  @override
  List<Tag>? get tags;
  @override
  @JsonKey(ignore: true)
  _$$_QiitaPostCopyWith<_$_QiitaPost> get copyWith =>
      throw _privateConstructorUsedError;
}
