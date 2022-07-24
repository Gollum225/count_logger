import 'package:flutter/material.dart';

class CounterCircle extends StatefulWidget {
  const CounterCircle({super.key});

  @override
  State<CounterCircle> createState() => _CounterCircleState();
}

class _CounterCircleState extends State<CounterCircle> {
  int clicked = 0;

  void _incrementCounter() {
    setState(() {
      clicked++;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget bigCircle = Container(
      width: 120.0,
      height: 120.0,
      decoration: const BoxDecoration(
        color: Colors.orange,
        shape: BoxShape.circle,
      ),
      child: GestureDetector(
        onLongPress:  () => {
          _incrementCounter()
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '$clicked',
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
                'Stuhl Rücker',
                style: Theme.of(context).textTheme.bodyLarge
            ),
          ],
        ),
      ),
    );

    return Material(child: bigCircle);
  }
}
