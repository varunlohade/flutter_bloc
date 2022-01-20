import 'dart:async';

import 'dart:developer';
import 'package:flutter/material.dart';
enum CounterAction { Increment, Decrement, Reset }

class Counterbloc {
  int counter = 0;
  final _stateStreamController = StreamController<int>();

  StreamSink<int> get countersink => _stateStreamController.sink;
  Stream<int> get counterStream => _stateStreamController.stream;
  final _eventStreamController = StreamController<CounterAction>();

  StreamSink<CounterAction> get eventsink => _eventStreamController.sink;
  Stream<CounterAction> get eventStream => _eventStreamController.stream;

  Counterbloc() {
    eventStream.listen((event) {
      if (event == CounterAction.Increment) {
        counter++;
      } else if (event == CounterAction.Decrement) {
        counter--;
      } else if (event == CounterAction.Reset) counter = 0;

      countersink.add(counter);
    });
  }
}
