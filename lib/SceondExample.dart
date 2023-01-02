import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SceondApiTest extends StatefulWidget {
  const SceondApiTest({Key? key}) : super(key: key);

  @override
  State<SceondApiTest> createState() => _SceondApiTestState();
}

class _SceondApiTestState extends State<SceondApiTest> {
  List<Photos> photoList = [];
  Future<List<Photos>> getPhotoApi() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        Photos photos = Photos(title: i['title'], url: i["url"], id: i["id"]);
        photoList.add(photos);
      }
      return photoList;
    } else {
      return photoList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Api Sceond Test")),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPhotoApi(),
                builder: ((context, AsyncSnapshot<List<Photos>> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: Text("No Found Data"),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: photoList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  snapshot.data![index].url.toString()),
                            ),
                            subtitle: Text('Id No:${snapshot.data![index].id}'),
                            title: Text(snapshot.data![index].title.toString()),
                          );
                        });
                  }
                })),
          )
        ],
      ),
    );
  }
}

class Photos {
  String title, url;
  int id;
  Photos({required this.title, required this.url, required this.id});
}
