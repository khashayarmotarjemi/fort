import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fort/posts/posts_bloc.dart';
import 'package:fort/posts/posts_repository.dart';
import 'package:fort/posts/posts_widget.dart';
import 'package:get_it/get_it.dart';

void main() {
  runApp(MyApp());

  final _postsRepo = SimplePostsRepository();
  final _postsBloc = PostsBloc(LoadingPosts(), _postsRepo);

  GetIt.I.registerSingleton(_postsRepo);
  GetIt.I.registerSingleton(_postsBloc);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Fort(),
    );
  }
}

class Fort extends StatefulWidget {
  Fort({Key key}) : super(key: key);

  @override
  _FortState createState() => _FortState();
}

class _FortState extends State<Fort> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("This is The Fort"),
        ),
        body: BlocProvider(
          create: (_) =>
              PostsBloc(LoadingPosts(), GetIt.I<SimplePostsRepository>()),
          child: PostsWidget(),
        ));
  }
}
