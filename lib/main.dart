import 'package:flutter/material.dart';
import 'package:studyingTestsAuto/pages/todoPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      // home: MyHomePage(),
      home: TodoList(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App de teste"),
      ),
      body: Center(
        child: Column(
          // Column is also a layout widget. It takes a list of children and

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Testing',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCounter,
        // onPressed: () => Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) {
        //     return TodoList();
        //   },
        // )),
        tooltip: 'Increment',
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

int testFunction(int a, int b) {
  if (a <= 0 || b <= 0) {
    throw new ArgumentError("O valor de A ou B tem que ser maior que zero");
  }
  return a + b;
}
