import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fort/common/widgets/loading_widget.dart';
import 'package:fort/posts/posts_bloc.dart';
import 'package:fort/posts/posts_list.dart';
import 'package:get_it/get_it.dart';

class PostsWidget extends StatefulWidget {
  @override
  _PostsWidgetState createState() => _PostsWidgetState();
}

class _PostsWidgetState extends State<PostsWidget> {
  _PostsWidgetState() {
    GetIt.I<PostsBloc>().add(FetchPosts());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsBloc, PostsState>(builder: (_, state) {
      if (state is PostsLoaded) {
        return PostsList(
          posts: state.posts,
        );
      } else if (state is FailedLoadingPosts) {
        return Center(
          child: Text("failed loading posts"),
        );
      } else if (state is LoadingPosts) {
        return LoadingWidget();
      } else {
        return Center(
          child: Text("other state $state"),
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    context.bloc().close();
  }
}
