import 'package:ex2/controller/fetch_post.dart';
import 'package:ex2/model/post.dart';
import 'package:ex2/view/components/post_list_item.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<Post>> futurePostList;

  @override
  void initState() {
    super.initState();
    futurePostList = fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Terceiro exercício LAB C214'),
      ),
      body: Center(
          child: FutureBuilder<List<Post>>(
        future: futurePostList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Post> data = snapshot.data!;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return PostListItem(
                    id: data[index].id,
                    userId: data[index].userId,
                    title: data[index].title,
                    body: data[index].body,
                  );
                });
          }
          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      )),
    );
  }
}
