import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/riverpod/data/models/qiita_post.dart';
import 'package:riverpod_sample/riverpod/data/repository/posts_repository.dart';

final errorMessageProvider = StateProvider<String>((_) => '');
final tagProvider = StateProvider<String>((_) => 'Flutter');

final postsViewModelProvider = FutureProvider.autoDispose<List<QiitaPost>>(
  (ref) async {
    final posts = await ref
        .watch(postsRepositoryProvider)
        .getQiitaPosts(ref.watch(tagProvider), 50);

    print(posts);

    return posts.when(
      success: (value) => value,
      failure: (error) {
        ref
            .read(errorMessageProvider.notifier)
            .update((state) => state = error.response!.statusCode.toString());
        return [];
      },
    );
  },
);
