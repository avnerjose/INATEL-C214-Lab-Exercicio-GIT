import 'package:flutter/material.dart';

class PostListItem extends StatefulWidget {
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
  State<PostListItem> createState() => _PostListItemState();
}

class _PostListItemState extends State<PostListItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return (Card(
      child: InkWell(
        onTap: () {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(100)),
                height: 40,
                width: 40,
                child: Center(
                  child: Text(
                    widget.id.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("User Id: ${widget.userId}"),
                  Text(
                    "Title: ${widget.title}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (_isExpanded) ...[
                    const SizedBox(height: 10),
                    Text(widget.body)
                  ]
                ],
              ),
            ),
          ]),
        ),
      ),
    ));
  }
}
