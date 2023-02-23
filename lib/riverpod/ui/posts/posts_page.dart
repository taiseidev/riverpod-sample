import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_sample/riverpod/ui/posts/post_item.dart';
import 'package:riverpod_sample/riverpod/ui/posts/posts_view_model.dart';

class PostsPage extends HookConsumerWidget {
  const PostsPage({super.key});

  static const primaryColor = Colors.black38;
  static const defaultTag = 'TypeScript';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(text: defaultTag);
    final posts = ref.watch(postsViewModelProvider(controller.text));

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Qiita投稿検索アプリ',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(postsViewModelProvider),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 50,
                child: TextFormField(
                  controller: controller,
                  style: const TextStyle(
                    fontSize: 15,
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () async {
                        if (controller.text.isNotEmpty) {
                          primaryFocus?.unfocus();
                          ref.invalidate(postsViewModelProvider);
                        }
                      },
                      icon: const Icon(Icons.search),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: posts.when(
                data: (posts) {
                  if (posts.isEmpty) {
                    return const Center(
                      child: Text(
                        '該当なし',
                        style: TextStyle(
                          fontSize: 15,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (_, index) {
                      final post = posts[index];
                      return ProviderScope(
                        overrides: [
                          currentPostProvider.overrideWithValue(post),
                        ],
                        child: const PostItem(),
                      );
                    },
                  );
                },
                error: (error, stackTrace) {
                  return Center(
                    child: Text(
                      error.toString(),
                      style: const TextStyle(
                        fontSize: 15,
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(color: primaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            context: context,
            builder: (context) => Container(),
          );
        },
        child: const Icon(Icons.question_mark),
      ),
    );
  }
}
