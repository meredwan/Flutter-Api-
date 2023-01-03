import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestApi2 extends StatefulWidget {
  const TestApi2({Key? key}) : super(key: key);

  @override
  State<TestApi2> createState() => _TestApi2State();
}

class _TestApi2State extends State<TestApi2> {
  List<TodoModel> todoList = [];

  Future<List<TodoModel>> gettodo() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        TodoModel todos =
            TodoModel(title: i["title"], completed: i["completed"]);
        todoList.add(todos);
      }
      return todoList;
    } else {
      return todoList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api"),
      ),
      body: Column(
        children: [
          FutureBuilder(
            future: gettodo(),
            builder: ((context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: Text("please insert data"),
              );
            } else {
              return ListView.builder(
                itemCount: todoList.length,
                itemBuilder: ((context, index) {
                return Text(todoList[index].title);
              }));
            }
          }))
        ],
      ),
    );
  }
}

class TodoModel {
  String title, completed;
  TodoModel({required this.title, required this.completed});
}
