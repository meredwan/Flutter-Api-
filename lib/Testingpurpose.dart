import 'dart:convert';

import 'package:api_test/Model/TodoModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestApi extends StatefulWidget {
  const TestApi({Key? key}) : super(key: key);

  @override
  State<TestApi> createState() => _TestApiState();
}

class _TestApiState extends State<TestApi> {
  List<TodoModel> todoList = [];
  Future<List<TodoModel>> gettodo() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      print(response.body);
      for (Map<String, dynamic> i in data) {
        todoList.add(TodoModel.fromJson(i));
      }
      return todoList;
    } else {
      return todoList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Testing Api")),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: gettodo(),
                builder: ((context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: Text("No Data"),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: todoList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  alignment: Alignment.topLeft,
                                  height: 120,
                                  decoration: BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                            text: "User Id:",
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                            children: [
                                              TextSpan(
                                                style: DefaultTextStyle.of(context).style,
                                                  text: todoList[index]
                                                      .userId
                                                      .toString())
                                            ]),
                                            
                                      ),
                                      Text("Id: ${todoList[index].id}"),
                                      Text("Title: ${todoList[index].title}"),
                                      Text(
                                          "Complete Status: ${todoList[index].completed}"),
                                    ],
                                  ),
                                ),
                              )
                            ],
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
