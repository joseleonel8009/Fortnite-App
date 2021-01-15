import 'package:app_fornite_api/Pages/DetallesListCos.dart';
import 'package:app_fornite_api/Utils/AllCos.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AllCosTab extends StatefulWidget {
  @override
  _AllCosTabState createState() => _AllCosTabState();
}

class _AllCosTabState extends State<AllCosTab> {
  String url = "https://fortnite-api.com/v2/cosmetics/br";
  List<AllCos> allCos = [];

  Future<dynamic> getAllCosData() async {
    http.Response data = await http.get(url);
    Map<String, dynamic> jsonData = json.decode(data.body);

    var opciones = jsonData["data"];
    for (var i in opciones) {
      AllCos listCos = AllCos(
        name: i["name"],
        description: i["description"],
        type: i["type"]["value"],
        series: i["series"],
        image: i["images"]["icon"],
      );
      allCos.add(listCos);
    }
    return allCos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getAllCosData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Container(
              child: Center(
                child: Text("No hay cosmeticos compa xd"),
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
                      top: 5.0,
                      left: 8.0,
                      right: 8.0,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 1.0, top: 3.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetallesListCos(snapshot.data[index]),
                            ),
                          );
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(snapshot.data[index].image),
                          ),
                          title: Text(snapshot.data[index].name),
                          trailing: Text("Type: ${snapshot.data[index].type}"),
                          subtitle: snapshot.data[index].series == null
                              ? Text("Sin serie")
                              : Text(snapshot.data[index].series["value"]),
                        ),
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
