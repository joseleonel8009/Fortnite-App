import 'package:app_fornite_api/Utils/Cosmetics.dart';
import 'package:flutter/material.dart';

class Detalles extends StatelessWidget {
  final Cosmetics cosmetics;
  Detalles(this.cosmetics);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            tooltip: "Volver",
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: Colors.deepPurpleAccent[400],
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              color: Colors.grey,
              child: Image.network(cosmetics.image),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                cosmetics.name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "${cosmetics.price.toString()} V bucks",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("${cosmetics.description}",
                style: TextStyle(fontSize: 16)),
          ),
          Text(
            "Type: ${cosmetics.type}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}
