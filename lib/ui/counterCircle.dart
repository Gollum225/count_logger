import 'package:flutter/material.dart';

class CounterCircle extends StatelessWidget {
  const CounterCircle({required this.title, super.key});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    Widget bigCircle = Container(
      width: 120.0,
      height: 120.0,
      decoration: const BoxDecoration(
        color: Colors.orange,
        shape: BoxShape.circle,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '69',
            style: Theme.of(context).textTheme.headline4,
          ),
          Text(
            'Stuhl Rücker',
            style: Theme.of(context).textTheme.bodyLarge
          ),
        ],
      ),
    );

    return Material(child: bigCircle);
  }
}
