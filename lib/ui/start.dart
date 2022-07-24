import 'dart:developer';

import 'package:count_logger/ui/counterAppBar.dart';
import 'package:count_logger/ui/eventList.dart';
import 'package:flutter/material.dart';

import 'eventBanner.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  static const CounterAppBar event1 = CounterAppBar(title: Text('first'));
  static const CounterAppBar event2 = CounterAppBar(title: Text('second'));


  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          CounterAppBar(
            title: Text(
              'Counter',
                style: Theme.of(context)
                    .primaryTextTheme
                    .headline4,
              ),
          ),
          // const Expanded(
          //   child: Center(
          //     child: Text('HIER KOMMT LISTE'),
          //   ),
          // ),
          const EventList(),
        ],
      ),
    );
  }
}