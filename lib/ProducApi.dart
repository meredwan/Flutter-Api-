import 'dart:convert';

import 'package:api_test/Model/ProductModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductApi extends StatefulWidget {
  const ProductApi({Key? key}) : super(key: key);

  @override
  State<ProductApi> createState() => _ProductApiState();
}

class _ProductApiState extends State<ProductApi> {
  Future<ProductsModel> getproductApi() async {
    final response = await http.get(
        Uri.parse("https://webhook.site/582f1dd2-c829-4ba5-bdb1-41b833e1f8e7"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ProductsModel.fromJson(data);
    } else {
      print(response.body);
      return ProductsModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Api Integration"),
      ),

      body: Column(),
      // body: Column(
      //   children: [
      //     Expanded(
      //       child: FutureBuilder<ProductsModel>(
      //         future: getproductApi(),
      //         builder: ((context, snapshot) {
      //           if (snapshot.hasData) {
      //             return ListView.builder(
      //               itemCount: snapshot.data!.data!.length,
      //               itemBuilder: ((context, index) {
      //                 return Column(
      //                   children: [
      //                     ListTile(
      //                       title: Text(snapshot.data!.data![index].shop!.name
      //                           .toString()),
      //                     ),
      //                     // Container(
      //                     //   height: MediaQuery.of(context).size.height * .25,
      //                     //   width: MediaQuery.of(context).size.width * .1,
      //                     //   child: ListView.builder(
      //                     //       itemCount:
      //                     //           snapshot.data!.data![index].images!.length,
      //                     //       itemBuilder: (context, position) {
      //                     //         return Container(
      //                     //             height:
      //                     //                 MediaQuery.of(context).size.height *
      //                     //                     .25,
      //                     //             width: MediaQuery.of(context).size.width *
      //                     //                 .5,
      //                     //             decoration: BoxDecoration(
      //                     //               image: DecorationImage(
      //                     //                   image: NetworkImage(snapshot
      //                     //                       .data!
      //                     //                       .data![index]
      //                     //                       .images![position]
      //                     //                       .url
      //                     //                       .toString())),
      //                     //             ));
      //                     //       }),
      //                     // ),
      //                   ],
      //                 );
      //               }),
      //             );
      //           } else {
      //             return Center(child: Text("Loading"));
      //           }
      //         }),
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
