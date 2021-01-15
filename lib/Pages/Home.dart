import 'package:app_fornite_api/Pages/MainHome.dart';
import 'package:app_fornite_api/Pages/Tabs/AllCosTab.dart';
import 'package:app_fornite_api/Pages/Tabs/NewsTab.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent[400],
        title: Text("Fortnite App"),
        bottom: tabs(),
      ),
      body: tabBarView(
        <Widget>[
          MainHome(),
          AllCosTab(),
          NewsTab(),
        ],
      ),
    );
  }

  TabBar tabs() {
    return TabBar(
      tabs: <Tab>[
        Tab(
          icon: Icon(Icons.shop),
          text: "Tienda",
        ),
        Tab(
          icon: Icon(Icons.list_alt_outlined),
          text: "Cosmeticos",
        ),
        Tab(
          icon: Icon(Icons.fiber_new),
          text: "Novedades",
        ),
      ],
      controller: _controller,
    );
  }

  TabBarView tabBarView(var views) {
    return TabBarView(
      children: views,
      controller: _controller,
    );
  }
}
