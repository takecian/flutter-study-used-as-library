import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(_widgetForRoute(window.defaultRouteName));

Widget _widgetForRoute(String route) {
  switch (route) {
    case '/home':
      return HomeApp();
    case '/sample':
      return SampleApp();
    default:
      return new Center(
        child: Text('Unknown route: $route', textDirection: TextDirection.ltr),
      );
  }
}

class HomeApp extends StatelessWidget {
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
  static const MethodChannel methodChannel = MethodChannel('com.takecian.flutter/method');
  static const EventChannel eventChannel = EventChannel('com.takecian.flutter/event');
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);

    methodChannel.setMethodCallHandler((MethodCall call) async {
      return "heyhey";
    });
  }

  void _onEvent(Object event) {
    setState(() {

    });
  }

  void _onError(Object error) {
    setState(() {

    });
  }

  Future<void>  _incrementCounter() async {
    try {
      final int result = await methodChannel.invokeMethod('get');
      setState(() {
        _counter += result;
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<void> _backTapped() async {
    try {
      await methodChannel.invokeMethod('back');
    } on PlatformException catch (e) {
      print(e);
    }
  }

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
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            RaisedButton(
              child: Text('戻る'),
              onPressed: _backTapped,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class SampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SamplePage(title: 'Sample Page'),
    );
  }
}

class SamplePage extends StatefulWidget {
  SamplePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SampleState createState() => new _SampleState();
}

class _SampleState extends State<SamplePage> {
  Future<void> _backTapped() async {
    SystemNavigator.pop(); // これでもいいらしい
  }

  Widget build(BuildContext context) {
    // The InkWell Wraps our custom flat button Widget
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          InkWell(
            onTap: () {
              SystemNavigator.pop();
            },
            child: Container(
              padding: EdgeInsets.all(12.0),
              child: Text('Flat Button'),
            ),
          ),
          ]),
        ),
      );
  }
}
