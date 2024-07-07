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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' JSON Parser'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                List<AndroidVersion> versions = _parseJson(firstJsonInput);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: versions.map((version) {
                          return Text('${version.id}: ${version.title}');
                        }).toList(),
                      ),
                    ),
                  ),
                );
              },
              child: Text('Parse Input 1'),
            ),
            ElevatedButton(
              onPressed: () {
                List<AndroidVersion> versions = _parseJson(secondJsonInput);
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: versions.map((version) {
                          return Text('${version.id}: ${version.title}');
                        }).toList(),
                      ),
                    ),
                  ),
                );
              },
              child: Text('Parse Input 2'),
            ),
          ],
        ),
      ),
    );
  }

  List<AndroidVersion> _parseJson(String jsonString) {
    final List<dynamic> jsonList = jsonDecode(jsonString);
    List<AndroidVersion> versions = [];

    for (var item in jsonList) {
      if (item is Map) {
        item.values.forEach((v) {
          versions.add(AndroidVersion(id: v['id'], title: v['title']));
        });
      } else if (item is List) {
        item.forEach((v) {
          versions.add(AndroidVersion(id: v['id'], title: v['title']));
        });
      }
    }

    return versions;
  }
}
