// ignore_for_file: must_be_immutable, prefer_const_constructors, sized_box_for_whitespace, annotate_overrides, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/counter_provider.dart';

class ScreenPage extends StatelessWidget {
  ScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Color.fromARGB(31, 110, 11, 11),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
              child: const Text(
            'Provider example App',
          )),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                  'You have pushed the Button this many times: ${context.watch<Counter>().count}'),
              Count(),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              key: Key('decrement_floatingactionButton'),
              onPressed: () => context.read<Counter>().decrement(),
              tooltip: 'Decrement',
              child: Icon(Icons.remove),
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
                key: Key('reset_floatingactionButton'),
                onPressed: () => context.read<Counter>().zero(),
                tooltip: 'Reset',
                child: Icon(Icons.exposure_zero)),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              key: Key('Increment_floatingactionButton'),
              onPressed: () => context.read<Counter>().increment(),
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

class Count extends StatelessWidget {
  const Count({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '${context.watch<Counter>().count}',
      key: Key('counterState'),
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
