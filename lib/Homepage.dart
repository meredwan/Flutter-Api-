// ignore: file_names
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String baseUrl = "https://kejubayer.com/api/";
  final String apisecret =
      "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2tlanViYXllci5jb20vYXBpL2xvZ2luIiwiaWF0IjoxNjcyNTgyNjcxLCJleHAiOjE2NzI1ODYyNzEsIm5iZiI6MTY3MjU4MjY3MSwianRpIjoiMTJtOVVWWkhpTUFCVUtibSIsInN1YiI6IjIiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.lp2BlWyFNJQ9Dc1EqFhJJ7YitoNpIZx0kKloT2-NWWQ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Test"),
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: () async {
                final response = await http.get(Uri.parse('$baseUrl/profile'),
                    headers: {"token": apisecret});
                
                print(response.body);
              },
              child: const Text("Get Calling"))),
    );
  }
}
