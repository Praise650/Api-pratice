import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../desc_screen/post_desc_screen.dart';
import 'view_model/display_post_view_model.dart';

class DisplayPost extends StatelessWidget {
  const DisplayPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DisplayPostViewModel>.reactive(
      viewModelBuilder: () => DisplayPostViewModel(),
      onModelReady: (model) => model.getData(),
      builder: (context, model, _) {
        return Scaffold(
          body: SafeArea(
            child: Visibility(
              visible: model.loading,
              replacement: ListView(
                  children: model.posts
                      .map(
                        (post) => Container(
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            border: Border.symmetric(
                              horizontal: BorderSide(
                                color: Colors.white54,
                                width: .5,
                              ),
                            ),
                          ),
                          child: ListTile(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostDescScreen(
                                  post: post,
                                ),
                              ),
                            ),
                            leading: Text(post.id.toString()),
                            title: Text(
                              post.title.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList()),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              model.getData();
            },
            tooltip: 'Add',
            backgroundColor: Colors.white,
            child: const Icon(
              Icons.add,
              color: Colors.blue,
            ),
          ),
        );
      },
    );
  }
}
