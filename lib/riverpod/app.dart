import 'package:flutter/material.dart';
import 'package:riverpod_sample/riverpod/ui/posts/posts_page.dart';

class QiitaApp extends StatelessWidget {
  const QiitaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qiita Client App',
      home: GestureDetector(
        onTap: () => primaryFocus?.unfocus(),
        child: const PostsPage(),
      ),
    );
  }
}
