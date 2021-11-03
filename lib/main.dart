import 'package:flutter/material.dart';
import 'package:state_mangement/counter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
                stream: counterBloc.counterStream,
                initialData: 0,
                builder: (context, snapshot) {
                  return Text(
                    '${snapshot.data}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                })
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: (){

      //     counterBloc.eventSink.add(CounterAction.Increment);
      //   },
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () {
                counterBloc.eventSink.add(CounterAction.Increment);
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
            
            SizedBox(width: 25,)
            ,
            FloatingActionButton(
              onPressed: () {
                counterBloc.eventSink.add(CounterAction.Decrement);
              },
              tooltip: 'Decrement',
              child: Icon(Icons.remove),
            ),
            SizedBox(width: 25,)
            ,
             FloatingActionButton(
              onPressed: () {
                counterBloc.eventSink.add(CounterAction.Reset);
              },
              tooltip: 'Decrement',
              child: Icon(Icons.exposure_zero),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
