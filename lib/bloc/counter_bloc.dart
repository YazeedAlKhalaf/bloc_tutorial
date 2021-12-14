import 'dart:async';

// those are the events that the user can do,
// aka `add` to the bloc and manipulate the bloc state.
enum CounterEvent {
  increment,
  decrement,
  reset,
}

class CounterBloc {
  late int _counter;

  final _stateStreamController = StreamController<int>();
  final _eventStreamController = StreamController<CounterEvent>();

  // should only be used inside the bloc.
  StreamSink<int> get _stateSink => _stateStreamController.sink;
  // this will be listened to in the ui to change the ui accordingly.
  Stream<int> get stateStream => _stateStreamController.stream;

  // this will be used to interact with the bloc and manipulate it from the ui.
  StreamSink<CounterEvent> get eventSink => _eventStreamController.sink;
  // should only be used inside the bloc.
  Stream<CounterEvent> get _eventStream => _eventStreamController.stream;

  CounterBloc() {
    // this is the inital state.
    _counter = 0;

    // here we listen to the events stream and run some logic on the state
    // according to the event provided.
    _eventStream.listen((CounterEvent event) {
      if (event == CounterEvent.increment) {
        _counter++;
      } else if (event == CounterEvent.decrement) {
        _counter--;
      } else if (event == CounterEvent.reset) {
        _counter = 0;
      }

      // the new counter is added to state after the manipulation.
      // this will be reflected in the ui.
      _stateSink.add(_counter);
    });
  }
}
