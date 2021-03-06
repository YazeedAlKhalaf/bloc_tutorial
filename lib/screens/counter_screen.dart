import 'package:bloc_tutorial/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  late final CounterBloc _counterBloc;

  @override
  void initState() {
    super.initState();

    // initialze counter bloc.
    _counterBloc = CounterBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Counter Screen",
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Use the buttons below to\nmanipulate the counter:",
                style: TextStyle(
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              StreamBuilder<int>(
                stream: _counterBloc.stateStream,
                builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                  final int counter = snapshot.data ?? 0;

                  return Text(
                    "$counter",
                    style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 48,
                    ),
                    textAlign: TextAlign.center,
                  );
                },
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      // add decrement event to counter bloc.
                      _counterBloc.eventSink.add(
                        CounterEvent.decrement,
                      );
                    },
                    icon: const Icon(
                      Icons.remove_rounded,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // add reset event to counter bloc.
                      _counterBloc.eventSink.add(
                        CounterEvent.reset,
                      );
                    },
                    icon: const Icon(
                      Icons.restore_rounded,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // add increment event to counter bloc.
                      _counterBloc.eventSink.add(
                        CounterEvent.increment,
                      );
                    },
                    icon: const Icon(
                      Icons.add_rounded,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
