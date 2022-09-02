import 'package:flutter/material.dart';

class PostListItem extends StatelessWidget {
  final int id;
  final int userId;
  final String title;
  final String body;

  const PostListItem(
      {Key? key,
      required this.id,
      required this.userId,
      required this.title,
      required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(100)),
              height: 40,
              width: 40,
              child: Center(
                child: Text(
                  id.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                ),
              )),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("User Id: $userId"),
                Text(
                  "Title: $title",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ]),
      ),
    ));
  }
}
