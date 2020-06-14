import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  Future<String> _calculation = Future<String>.delayed(
    Duration(seconds: 4),
    () => 'Large Latte!',
  );

  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headline4,
      textAlign: TextAlign.center,
      child: FutureBuilder<String>(
        future: _calculation,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          List<Widget> children;
          if (snapshot.hasData) {
            children = <Widget>[
              Icon(
                Icons.tag_faces,
                color: Colors.pink,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text('${snapshot.data}'),
              )
            ];
          } else if (snapshot.hasError) {
            children = <Widget>[
              Icon(
                Icons.error_outline,
                color: Colors.red,
                size: 60,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text('${snapshot.error}'),
              )
            ];
          } else {
            children = <Widget>[
              SizedBox(
                child: LinearProgressIndicator(),
                width: 150,
                height: 60,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text('잠시만 기다려주세요'),
              )
            ];
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }
}
