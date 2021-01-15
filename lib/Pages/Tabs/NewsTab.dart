import 'dart:convert';

import 'package:app_fornite_api/Utils/News.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsTab extends StatefulWidget {
  @override
  _NewsTabState createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
  String url = "https://fortnite-api.com/v2/news";
  List<News> news = [];

  Future<dynamic> getNews() async {
    http.Response newsData = await http.get(url);
    Map<String, dynamic> jsonDataNews = json.decode(newsData.body);

    var opciones = jsonDataNews["data"]["br"]["motds"];
    for (var i in opciones) {
      News not = News(
        image: i["image"],
        title: i["title"],
        tabTitle: i["tabTitle"],
      );
      news.add(not);
    }
    return news;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getNews(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Container(
              child: Center(
                child: Text("No hay novedades compa xd"),
              ),
            );
          } else {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(
                      Colors.deepPurpleAccent[100],
                    ),
                    backgroundColor: Colors.deepPurpleAccent[400],
                  ),
                ),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      top: 16.0,
                      left: 8.0,
                      right: 8.0,
                    ),
                    child: Card(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(snapshot.data[index].image),
                          ),
                          if (snapshot.data[index].tabTitle == null)
                            Text(snapshot.data[index].title)
                          else
                            Text(snapshot.data[index].tabTitle),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
