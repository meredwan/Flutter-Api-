import 'package:api_test/Home_Screen.dart';
import 'package:api_test/ProducApi.dart';
import 'package:api_test/SceondExample.dart';
import 'package:api_test/Testingpurpose.dart';
import 'package:api_test/TesttingApi.dart';
import 'package:api_test/UserApi.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductApi(),
    );
  }
}
