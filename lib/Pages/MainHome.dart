import 'package:app_fornite_api/Pages/Detalles.dart';
import 'package:app_fornite_api/Utils/Cosmetics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:date_time_format/date_time_format.dart';

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  String url = "https://fortnite-api.theapinetwork.com/store/get";
  List<Cosmetics> cosmetics = [];
  final dateTime = DateTime.now();

  Future<dynamic> getData() async {
    http.Response data = await http.get(url);
    Map<String, dynamic> jsonData = json.decode(data.body);

    var opciones = jsonData["data"];

    for (var i in opciones) {
      Cosmetics cos = Cosmetics(
        name: i["item"]["name"],
        description: i["item"]["description"],
        type: i["item"]["type"],
        image: i["item"]["images"]["icon"],
        price: i["store"]["cost"],
      );
      cosmetics.add(cos);
    }
    return cosmetics;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Tienda de Hoy ${dateTime.format("d/m")}",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Container(
              child: Center(
                child: Text("No hay datos compa xd"),
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
                itemBuilder: (BuildContext context, int index) {
                  var description = snapshot.data[index].description == null
                      ? "no tiene descripcion"
                      : "${snapshot.data[index].description}".capitalizeFirst;
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Detalles(snapshot.data[index]),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(snapshot.data[index].image),
                        ),
                        title: Text(snapshot.data[index].name),
                        subtitle: Text(
                            "$description \nprecio: ${snapshot.data[index].price} V bucks"),
                        trailing: Text("Type: ${snapshot.data[index].type}"),
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
