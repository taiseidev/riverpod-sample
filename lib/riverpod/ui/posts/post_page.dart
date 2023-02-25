import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_sample/riverpod/ui/posts/post_detail_page.dart';
import 'package:riverpod_sample/riverpod/ui/posts/post_item.dart';
import 'package:riverpod_sample/riverpod/use_case/fetch_qiita_posts.dart';

class PostPage extends HookConsumerWidget {
  PostPage({super.key});

  static const primaryColor = Colors.black38;
  static const defaultTag = 'TypeScript';

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ページング用
    final page = useState(1);

    final controller = useTextEditingController(text: defaultTag);

    final posts = ref.watch(
      fetchQiitaPostsProvider(tag: controller.text, page: page.value),
    );

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
        color: primaryColor,
        onRefresh: () async {
          page.value = page.value++;
          await Future<void>.delayed(const Duration(seconds: 1));
          ref.invalidate(fetchQiitaPostsProvider);
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 50,
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: controller,
                    validator: (value) =>
                        value == null || value.isEmpty ? '入力してください' : null,
                    style: const TextStyle(
                      fontSize: 15,
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            primaryFocus?.unfocus();
                            ref.invalidate(fetchQiitaPostsProvider);
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
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PostDetailPage(post),
                            ),
                          ),
                          child: const PostItem(),
                        ),
                      );
                    },
                  );
                },
                error: (error, _) {
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
        onPressed: () async {
          await showModalBottomSheet(
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
