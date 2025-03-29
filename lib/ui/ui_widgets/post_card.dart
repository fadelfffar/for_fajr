// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PostCard extends StatelessWidget {
  String textMasjidName;
  String textMasjidLocation;

  PostCard({
    Key? key,
    required this.textMasjidName,
    required this.textMasjidLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Card(
        child: Column(
          children: [
            Text(textMasjidName),
            Text(textMasjidLocation),
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