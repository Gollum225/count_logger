import 'package:count_logger/ui/counterCircle.dart';
import 'package:count_logger/ui/eventBanner.dart';
import 'package:flutter/material.dart';

class EventList extends StatelessWidget {

    static const EventBanner event1 = EventBanner(title: Text('first'));
    static const EventBanner event2 = EventBanner(title: Text('second'));
    static const CounterCircle counter = CounterCircle(title: Text('second'));

  const EventList({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      // final listTiles = <Widget>[
      //   const ListTile(
      //     title: Text('Tile 0: basic'),
      //   ),
      //   const Divider(),
      //   const ListTile(
      //     leading: Icon(Icons.face),
      //     title: Text('Tile 1: with leading/trailing widgets'),
      //     trailing: Icon(Icons.tag_faces),
      //   ),
      //   const Divider(),
      //   const ListTile(
      //     title: Text('Tile 2 title'),
      //     subtitle: Text('subtitle of tile 2'),
      //   ),
      //   const Divider(),
      //   const ListTile(
      //     title: Text('Tile 3: 3 lines'),
      //     isThreeLine: true,
      //     subtitle: Text('subtitle of tile 3'),
      //   ),
      //   const Divider(),
      //   const ListTile(
      //     title: Text('Tile 4: dense'),
      //     dense: true,
      //   ),
      //   const Divider(),
      //   const ListTile(
      //     title: Text('Tile5: tile with badge'),
      //     subtitle: Text('(This uses the badges package)'),
      //     // trailing: Badge(
      //     //   badgeContent: const Text('3'),
      //     //   child: const Icon(Icons.message),
      //     // ),
      //   ),
      // ];

        return ListView(
          shrinkWrap: true,
            children: const [counter],
        );

    }
}