// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          // ignore: avoid_unnecessary_containers
          child: Container(
              child: ElevatedButton(
            child: const Text('Clic aqui'),
            onPressed: () async {
              var url = Uri.http('192.168.1.70:8000', '/api/productos', {});

              // Await the http get response, then decode the json-formatted response.
              var response = await http.get(url);
              if (response.statusCode == 200) {
                var jsonResponse = convert
                    .jsonDecode(response.body); // as Map<String, dynamic>;
                //var itemCount = jsonResponse['totalItems'];
                // ignore: unused_local_variable
                String producto = jsonResponse[0]['producto'];
                print('Producto 1: $producto');

                //print(response.body);
              } else {
                print('Request failed with status: ${response.statusCode}.');
              }
            },
          )),
        ),
      ),
    );
  }
}
