import 'dart:convert';

import 'package:api_test/Model/PostModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostModel> postList = [];
  Future<List<PostModel>> getPostApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        postList.add(PostModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text("Api Course"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPostApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator()
                    );
                  } else {
                    return ListView.builder(
                        itemCount: postList.length,
                        itemBuilder: ((context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all( 10),
                                  alignment: Alignment.topLeft,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.withOpacity(0.5)
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Id : ${postList[index].id}"),
                                      Text("User Id :${postList[index].userId}"),
                                      Text(
                                        "Title :${postList[index].title}",
                                        maxLines: 2,
                                      ),
                                      Text(
                                        "Body:${postList[index].body}",
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        }));
                  }
                }),
          )
        ],
      ),
    );
  }
}
