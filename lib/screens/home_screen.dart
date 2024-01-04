import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String title = "Flutter fetching data";
  String name = "";
  String username = "";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Nom : $name',
                    style: const TextStyle(fontSize: 16),
                  )),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Align(
                    child: Text(
                  'Username: $username',
                  style: const TextStyle(fontSize: 16),
                )),
              ),
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    title = "Data fetching from API";
                  });
                  var url =
                      Uri.parse('https://jsonplaceholder.typicode.com/users/5');
                  var response = await http.get(url);
                  var data = convert.jsonDecode(response.body);
                  name = data['name'];
                  username = data['username'];
                  setState(() {});
                },
                child: const Text("Afficher les donnees"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
