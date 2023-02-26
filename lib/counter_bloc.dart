import 'dart:async';

import 'package:counterapp/counter_event.dart';

//enum streamActionList { inc, dec, reset }

class CounterBloc {
  int _counter = 0;
  // ignore: unused_field
  final _stateController = StreamController<int>();
  StreamSink<int> get _inCounter => _stateController.sink;
  Stream<int> get counter => _stateController.stream;

  final _streamController = StreamController<CounterEvent>();
  Sink<CounterEvent> get eventSink => _streamController.sink;
  //Stream<streamActionList> get eventStream => _streamController.stream;

  CounterBloc() {
    print("chap dilam button function er vitor theke");
    // counter = 0;
    _streamController.stream.listen(event1);
  }

  void event1(CounterEvent event) {
    if (event is IncreEvent) {
      _counter++;
    } else {
      _counter--;
    }
    _inCounter.add(_counter);

    // if (event == streamActionList.inc) {
    //   counter++;
    //   stateSink.add(counter);
    //   print("chap dilam button function er vitor theke");
    // } else if (event == streamActionList.dec) {
    //   counter--;
    //   stateSink.add(counter);
    // } else if (event == streamActionList.reset) {
    //   counter = 0;
    //   stateSink.add(counter);
    // }
  }

  void dispose() {
    _stateController.close();
    _streamController.close();
  }
}
