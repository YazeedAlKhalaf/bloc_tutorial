import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  void initState() {
    super.initState();

    // TODO: initialize counter bloc.
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
              const Text(
                // TODO: replace this with the state from the counter bloc.
                "0",
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      // TODO: add decrement event to counter bloc.
                    },
                    icon: const Icon(
                      Icons.remove_rounded,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // TODO: add reset event to counter bloc.
                    },
                    icon: const Icon(
                      Icons.restore_rounded,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // TODO: add increment event to counter bloc.
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
