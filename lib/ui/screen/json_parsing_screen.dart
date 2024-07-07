import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:json_parser/ui/data/model/android_version_model.dart';

class JsonParsingScreen extends StatefulWidget {
  @override
  State<JsonParsingScreen> createState() => _JsonParsingScreenState();
}

class _JsonParsingScreenState extends State<JsonParsingScreen> {
  final String firstJsonInput = '''
  [{"0":{"id":1,"title":"Gingerbread"},"1":{"id":2,"title":"Jellybean"},"3":{"id":3,"title":"KitKat"}},[{"id":4,"title":"Lollipop"},{"id":5,"title":"Pie"},{"id":6,"title":"Oreo"},{"id":7,"title":"Nougat"}]]
  ''';

  final String secondJsonInput = '''
  [{"0":{"id":1,"title":"Gingerbread"},"1":{"id":2,"title":"Jellybean"},"3":{"id":3,"title":"KitKat"}},{"0":{"id":8,"title":"Froyo"},"2":{"id":9,"title":"Éclair"},"3":{"id":10,"title":"Donut"}},[{"id":4,"title":"Lollipop"},{"id":5,"title":"Pie"},{"id":6,"title":"Oreo"},{"id":7,"title":"Nougat"}]]
  ''';

  bool inProgress = false;
  bool inProgressTwo = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' JSON Parser'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  inProgress =! inProgress ;
                  setState(() { 
                  });
                },
                child: Text('Parse Input one'),
              ),
              SizedBox(height: 10),
              Visibility(
              visible: inProgress == false,
              replacement: _dataTable(_parseJson(firstJsonInput)),
              child: Container(),
              
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  inProgressTwo =! inProgressTwo ;
                  setState(() {              
                  });
                },
                child: Text('Parse Input Two'),
              ),
              SizedBox(height: 10),
              Visibility(
              visible: inProgressTwo == false,
              replacement: _dataTable(_parseJson(secondJsonInput)),
              child: Container(),     
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<AndroidVersion> _parseJson(String jsonString) {
    final List<dynamic> jsonList = jsonDecode(jsonString);
    List<AndroidVersion> parsedJson = [];

    for (var item in jsonList) {
      if (item is Map) {
        item.values.forEach((v) {
          parsedJson.add(AndroidVersion(id: v['id'], title: v['title']));
        });
      } else if (item is List) {
        item.forEach((v) {
          parsedJson.add(AndroidVersion(id: v['id'], title: v['title']));
        });
      }
    }

    return parsedJson;
  }

  Widget _dataTable (List <AndroidVersion> data) {
    return DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Text(
              'ID',
              style: TextStyle(fontStyle: FontStyle.italic , fontSize: 18),
            ),
          ),
          DataColumn(
            label: Text(
              'Value',
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18 ),
            ),
          ),
        ],
        rows: data.map((item) {
          return DataRow(
            cells: <DataCell>[
              DataCell(Text(item.id.toString() , style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),)),
              DataCell(Text(item.title.toString(), style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),),
            ],
          );
        }).toList(),
      );
  }
}
