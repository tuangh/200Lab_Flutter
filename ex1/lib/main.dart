import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'C - F Converter',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'C F Converter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _cText = "";
  final _fController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fController.addListener(_calC);
  }

  @override
  void dispose() {
    _fController.dispose();
    super.dispose();
  }

  _calC() {
    final double fValue = _fController.text.isNotEmpty ? double.parse(
        _fController.text) : null;
    double cValue = _convertFtoC(fValue);

    setState(() {
      _cText = _toDegreeText(cValue);
    });
  }

  String _toDegreeText(double v) {
    if (v == null)
      return "";

    return "${v % 1 == 0 ? v.toInt() : v}";
  }

  double _convertCtoF(double cValue) {
    if (cValue == null)
      return null;

    return (cValue * 9 / 5) + 32;
  }

  double _convertFtoC(double fValue) {
    if (fValue == null)
      return null;

    return (fValue - 32) * 5 / 9;
  }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            children: <Widget>[
              TextFormField(
                  key: Key(_cText),
                  initialValue: _cText,
                  onChanged: (text) {
                    double fValue;
                    if (text.isNotEmpty) {
                      fValue = _convertCtoF(double.parse(text));
                    }

                    _fController.removeListener(_calC);
                    _fController.text = _toDegreeText(fValue);
                    _fController.addListener(_calC);
                  },
                  decoration: InputDecoration(
                      hintText: "C"
                  ),
                  keyboardType: TextInputType.number
              ),
              TextField(
                  controller: _fController,
                  decoration: InputDecoration(
                      hintText: "F"
                  ),
                  keyboardType: TextInputType.number
              ),
            ],
          ),
        )
    );
  }
}
