import 'package:app_fornite_api/Pages/Tabs/AllCosTab.dart';
import 'package:flutter/material.dart';
import 'Pages/Home.dart';
import 'Pages/Tabs/NewsTab.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  var routes = <String, WidgetBuilder>{
    "Home": (BuildContext context) => Home(),
    "News": (BuildContext context) => NewsTab(),
    "ListCos": (BuildContext contex) => AllCosTab(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fortnite App",
      debugShowCheckedModeBanner: false,
      home: Home(),
      routes: routes,
    );
  }
}
