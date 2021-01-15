import 'package:app_fornite_api/Utils/AllCos.dart';
import 'package:flutter/material.dart';

class DetallesListCos extends StatelessWidget {
  final AllCos listCos;
  DetallesListCos(this.listCos);

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
          },
        ),
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
              child: Image.network(listCos.image),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                listCos.name,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (listCos.series == null)
                Text(
                  "Sin Serie",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                )
              else
                Text(
                  listCos.series["value"],
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ),
                )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "${listCos.description}",
              style: TextStyle(fontSize: 16),
            ),
          ),
          Text(
            "Type: ${listCos.type}",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}
