import 'package:flutter/material.dart';

import '../../src/model.dart';

class PostDescScreen extends StatelessWidget {
  const PostDescScreen({Key? key, required this.post}) : super(key: key);
  final Post post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.maybePop(context),
          child: const Icon(
            Icons.chevron_left,
          ),
        ),
        title: Text(
          '${post.id} ${post.title}',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              '${post.title}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              post.body.toString(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
