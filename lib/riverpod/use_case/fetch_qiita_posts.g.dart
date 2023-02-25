// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_qiita_posts.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchQiitaPostsHash() => r'49a6bacf4d7a9b2fbc772f85fb26d6b01d2b97ed';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef FetchQiitaPostsRef = AutoDisposeFutureProviderRef<List<QiitaPost>>;

/// See also [fetchQiitaPosts].
@ProviderFor(fetchQiitaPosts)
const fetchQiitaPostsProvider = FetchQiitaPostsFamily();

/// See also [fetchQiitaPosts].
class FetchQiitaPostsFamily extends Family<AsyncValue<List<QiitaPost>>> {
  /// See also [fetchQiitaPosts].
  const FetchQiitaPostsFamily();

  /// See also [fetchQiitaPosts].
  FetchQiitaPostsProvider call({
    required String tag,
    required int page,
  }) {
    return FetchQiitaPostsProvider(
      tag: tag,
      page: page,
    );
  }

  @override
  FetchQiitaPostsProvider getProviderOverride(
    covariant FetchQiitaPostsProvider provider,
  ) {
    return call(
      tag: provider.tag,
      page: provider.page,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchQiitaPostsProvider';
}

/// See also [fetchQiitaPosts].
class FetchQiitaPostsProvider
    extends AutoDisposeFutureProvider<List<QiitaPost>> {
  /// See also [fetchQiitaPosts].
  FetchQiitaPostsProvider({
    required this.tag,
    required this.page,
  }) : super.internal(
          (ref) => fetchQiitaPosts(
            ref,
            tag: tag,
            page: page,
          ),
          from: fetchQiitaPostsProvider,
          name: r'fetchQiitaPostsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchQiitaPostsHash,
          dependencies: FetchQiitaPostsFamily._dependencies,
          allTransitiveDependencies:
              FetchQiitaPostsFamily._allTransitiveDependencies,
        );

  final String tag;
  final int page;

  @override
  bool operator ==(Object other) {
    return other is FetchQiitaPostsProvider &&
        other.tag == tag &&
        other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, tag.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
