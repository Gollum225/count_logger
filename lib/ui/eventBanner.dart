import 'package:flutter/material.dart';

class EventBanner extends StatelessWidget{
  const EventBanner({required this.title, super.key});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0, // in logical pixels
      width: 100.0,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: const BoxDecoration(color: Colors.black38),
      // Row is a horizontal, linear layout.
      child: Row(
        children: [
          Expanded(
            child: title,
          ),
          const IconButton(
            icon: Icon(Icons.delete),
            tooltip: 'delete',
            onPressed: null,
          ),
        ],
      ),
    );
  }
}