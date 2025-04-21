// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PrimaryButton extends StatelessWidget {
  // NOTE: if VoidCallback + required this.onPressedData is uncommented then route error
  final void Function() onPressedData;
  final String textButtonData;
  const PrimaryButton({
    super.key,
    required this.onPressedData,
    required this.textButtonData,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressedData,
      style: ButtonStyle(
        fixedSize: const WidgetStatePropertyAll(Size(368, 49),),
        backgroundColor: WidgetStatePropertyAll(
          Theme.of(context).colorScheme.primaryContainer
          ),
      ),
      child: Text(
        textButtonData,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          fontWeight: FontWeight.bold,
          fontSize: 18)),
    );
  }
}