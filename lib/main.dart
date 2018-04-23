import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:plus_1_up/client.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
  
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String, dynamic> receivedResponse;
  List<Client> clients = List();

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("https://plus1up-staging.herokuapp.com/api/clients"),
        headers: {"Accept": "application/json"});

    this.setState(() {
      receivedResponse = json.decode(response.body);
      for (var value in receivedResponse['data']) {
        clients.add(Client.fromJson(value));
      }
    });

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Listviews"),
      ),
      body: new ListView.builder(
        itemCount: clients == null ? 0 : clients.length,
        itemBuilder: (BuildContext context, int index) {
          return new Card(
            child: new Text(clients[index].name),
          );
        },
      ),
    );
  }
}
