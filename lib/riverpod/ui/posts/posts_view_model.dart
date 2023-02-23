import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/riverpod/data/models/qiita_post.dart';
import 'package:riverpod_sample/riverpod/data/repository/posts_repository.dart';

final errorMessageProvider = StateProvider<String>((_) => '');

final postsViewModelProvider =
    FutureProvider.family.autoDispose<List<QiitaPost>, String>(
  (ref, value) async {
    final posts = await ref.read(postsRepositoryProvider).getQiitaPosts(value);

    return posts.when(
      success: (value) => value,
      failure: (error) {
        if (error.response == null) {
          return [];
        }
        ref
            .read(errorMessageProvider.notifier)
            .update((state) => state = error.response!.statusCode.toString());
        return [];
      },
    );
  },
);
