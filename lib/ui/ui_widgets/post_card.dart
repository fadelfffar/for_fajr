// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PostCard extends StatelessWidget {
  String postTitle;
  String postCaption;

  PostCard({
    Key? key,
    required this.postTitle,
    required this.postCaption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Card(
        child: Column(
          children: [
            Text(postTitle),
            Text(postCaption),
            Row(
            children: [
              Text("Like Number"),
              Icon(Icons.thumb_up_sharp),
            ],)
          ],
        ),
      ),
    );
  }
}