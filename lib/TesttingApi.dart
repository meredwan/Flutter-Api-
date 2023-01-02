import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class TestApi2 extends StatefulWidget {
  const TestApi2({Key? key}) : super(key: key);

  @override
  State<TestApi2> createState() => _TestApi2State();
}

class _TestApi2State extends State<TestApi2> {
  List<TodoModel> getTodoList = [];

  Future<List<TodoModel>> getApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        TodoModel gettodo =
            TodoModel(title: i["title"], completed: i["completed"]);
        getTodoList.add(gettodo);
      }
      return getTodoList;
    } else {
      return getTodoList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Test"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getApi(),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: Text("kisui pai nai"),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: getTodoList.length,
                        itemBuilder: ((context, index) {
                          return Container(
                            child: Column(
                              children: [
                                Text(getTodoList[index].title.toString())
                              ],
                            ),
                          );
                        }));
                  }
                })),
          )
        ],
      ),
    );
  }
}

class TodoModel {
  String title, completed;
  TodoModel({required this.title, required this.completed});
}
