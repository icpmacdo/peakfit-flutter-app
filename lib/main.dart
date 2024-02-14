import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import the http package
import 'dart:convert'; // For handling JSON data

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _apiResponse = '';

  void _makeApiRequest() async {
    // Replace with your actual API endpoint
    final url = Uri.parse('https://api.example.com/data'); 
    final response = await http.get(url);

    setState(() {
      if (response.statusCode == 200) {
        _apiResponse = jsonDecode(response.body)['your_data_field'];
      } else {
        _apiResponse = 'Error: ${response.statusCode}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Flutter App'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_apiResponse), 
            ElevatedButton(
              onPressed: _makeApiRequest,
              child: const Text('Fetch Data'),

            ),
            ElevatedButton(
              onPressed: _makeApiRequest,
              child: const Text('Fetch Data 2'),
              onHover: (value) {
                print(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}

