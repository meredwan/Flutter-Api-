import 'dart:convert';

import 'package:api_test/Model/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserApi extends StatefulWidget {
  const UserApi({Key? key}) : super(key: key);

  @override
  State<UserApi> createState() => _UserApiState();
}

class _UserApiState extends State<UserApi> {
  List<UserModel> userList = [];
  Future<List<UserModel>> getUserApi() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> i in data) {
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    } else {
      return userList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Api"),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApi(),
              builder: ((context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: Text("on data found"),
                  );
                } else {
                  return ListView.builder(
                      itemCount: userList.length,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            alignment: Alignment.topLeft,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('ID NO: ${userList[index].id}'),
                                  Text('Name: ${userList[index].name}'),
                                  Text('Email: ${userList[index].email}'),
                                  Text(
                                      'Address: ${userList[index].address!.street}${userList[index].address!.zipcode}${userList[index].address!.geo!.lat}'),
                                  Text('Email: ${userList[index].company!.name}'),
                                ],
                              ),
                            ),
                          ),
                        );
                      }));
                }
              }),
            ),
          )
        ],
      ),
    );
  }
}
