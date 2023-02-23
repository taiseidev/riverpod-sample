import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_sample/riverpod/data/models/qiita_post.dart';

final currentPostProvider =
    Provider<QiitaPost>((ref) => throw UnimplementedError());

class PostItem extends ConsumerWidget {
  const PostItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final post = ref.watch(currentPostProvider);

    return Card(
      elevation: 4,
      child: ListTile(
        leading: post.user!.profileImageUrl != null
            ? CircleAvatar(
                backgroundImage: NetworkImage(
                  '${post.user!.profileImageUrl}',
                ),
              )
            : const SizedBox.shrink(),
        title: Text(
          '${post.title}',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.red[400],
                    size: 24,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '${post.likesCount}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  const Icon(
                    Icons.bookmark_add,
                    color: Color.fromARGB(255, 167, 156, 119),
                    size: 24,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    '${post.stocksCount}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              Wrap(
                children: post.tags!
                    .map(
                      (tag) => Padding(
                        padding: const EdgeInsets.only(left: 2.0),
                        child: Chip(
                          label: Text(
                            tag.name!,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          backgroundColor: Colors.black38,
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 1),
                          visualDensity: const VisualDensity(
                              horizontal: 0.0, vertical: -4),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
