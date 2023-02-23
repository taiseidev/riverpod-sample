import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_sample/riverpod/ui/posts/post_item.dart';
import 'package:riverpod_sample/riverpod/ui/posts/posts_view_model.dart';

class PostsPage extends HookConsumerWidget {
  const PostsPage({super.key});

  static const primaryColor = Color(0xff59bb0c);
  static const defaultTag = 'TypeScript';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postsViewModelProvider);
    final controller = useTextEditingController();

    Future<void> errorDialog(String title) async {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                ),
                child: const Text("閉じる"),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          );
        },
      );
    }

    ref.listen<String>(
      errorMessageProvider,
      ((previous, next) {
        if (next == '403') {
          errorDialog('検索できないよ😡');
        }
        if (next == '404') {
          errorDialog('投稿が見つかりません😢');
        }
      }),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Qiita投稿検索アプリ',
          style: TextStyle(
            color: Colors.black38,
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(postsViewModelProvider);
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 50,
                child: TextFormField(
                  controller: controller,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () async {
                        if (controller.text.isNotEmpty) {
                          primaryFocus?.unfocus();
                          ref
                              .read(tagProvider.notifier)
                              .update((state) => state = controller.text);
                          ref.invalidate(postsViewModelProvider);
                          controller.clear();
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
                data: (posts) => ListView.builder(
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
                ),
                error: (error, stackTrace) {
                  return const Center(
                    child: Text(
                      'エラーが発生しました',
                      style: TextStyle(
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
    );
  }
}
