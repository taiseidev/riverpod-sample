import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/riverpod/data/models/qiita_post.dart';
import 'package:url_launcher/url_launcher.dart';

class PostDetailPage extends ConsumerWidget {
  const PostDetailPage(this.post, {super.key});

  static const primaryColor = Colors.black38;

  final QiitaPost post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '投稿詳細画面',
          style: TextStyle(
            color: primaryColor,
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.blue),
                children: [
                  TextSpan(
                    text: post.url,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        final url = Uri.parse(post.url!);
                        if (!await launchUrl(url)) {
                          throw Exception('Could not launch $url');
                        }
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
