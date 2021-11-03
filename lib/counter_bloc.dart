import 'dart:async';


enum CounterAction{
  Increment,Decrement,Reset
}

class CounterBloc{
  int Counter;
  final _stateStremController = StreamController<int>();

  StreamSink<int> get counterSink => _stateStremController.sink;
  Stream<int> get counterStream => _stateStremController.stream;


   final _eventStremController = StreamController<CounterAction>();

  StreamSink<CounterAction> get eventSink => _eventStremController.sink;
  Stream<CounterAction> get eventStream => _eventStremController.stream;


  CounterBloc(){
    Counter=0;
    eventStream.listen((event) {
      if(event==CounterAction.Increment) Counter++;
      else if(event==CounterAction.Decrement) Counter--;
      else if(event == CounterAction.Reset) Counter=0;

      counterSink.add(Counter);
    });
  }

}