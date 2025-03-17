// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MasjidCard extends StatelessWidget {
  String textMasjidName;
  String textMasjidLocation;
  String textMasjidEvent;

  MasjidCard({
    Key? key,
    required this.textMasjidName,
    required this.textMasjidLocation,
    required this.textMasjidEvent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Card(
        child: ListTile(
          leading: Text(textMasjidName),
          title: Text(textMasjidLocation),
          subtitle: Text(textMasjidEvent),
          selectedColor: Color.fromARGB(255, 13, 32, 108),
          textColor: Color.fromARGB(255, 8, 154, 69),
        ),
      ),
    );
  }
}
