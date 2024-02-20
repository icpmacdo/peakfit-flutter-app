/// This file contains the main entry point of the Flutter application.
/// It imports necessary packages for building UI, making HTTP requests, and handling JSON data.
/// It also imports the `intl` package for formatting dates and numbers.
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Import the http package
import 'dart:convert'; // For handling JSON data
import 'package:intl/intl.dart';


void main() => runApp(const MyApp());

/// The main application widget.
/// 
/// This widget represents the root of the application.
/// It creates a [MaterialApp] widget with a title and theme,
/// and sets the home page to [MyHomePage].
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PeakFit',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

/// Represents the home page of the application.
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/// The state class for the MyHomePage widget.
class _MyHomePageState extends State<MyHomePage> {
  String _apiResponse = '';

  void _makeApiRequest(location) async {
    print(location);
    
    // final url = Uri.parse('https://api.example.com/data'); 
    // final response = await http.get(url);

    // setState(() {
    //   if (response.statusCode == 200) {
    //     _apiResponse = jsonDecode(response.body)['your_data_field'];
    //   } else {
    //     _apiResponse = 'Error: ${response.statusCode}';
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title is todays date in plain english
        title: Text(DateFormat('MMMM d').format(DateTime.now()), style: TextStyle(fontSize: 24),

      )),
      body: Column( // Use Column for top-to-bottom layout
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space items vertically
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(16.0), // Padding around text
          //   child: Text(
          //     'Welcome to PeakFit!',
          //     style: TextStyle(fontSize: 24),
          //   ),
          // ),
          // Center(
          //   child: Text("_apiResponse friends list and their status!"),
          // ),

          // friends list and their status
          Padding(
            padding: const EdgeInsets.all(16.0), // Padding around text
            child: Column(
              children: [
                Text(
                  'Friends List',
                  style: TextStyle(fontSize: 24),
                ),
                for (int i = 1; i <= 4; i++)
                  Text(
                    'Friend $i: ${i % 2 == 0 ? '🧗' : '🏋️'}',
                    style: TextStyle(fontSize: 24),
                  ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0), // Padding around buttons
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distribute buttons evenly
              children: [
                ElevatedButton(
                  onPressed: () {
                    const location = 'outside';
                    _makeApiRequest(location);
                  },
                  child: const Text('🧗'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 70), 
                    textStyle: TextStyle(fontSize: 40), // Increased font size 
                  ),
                ),
                SizedBox(width: 16.0), 
                ElevatedButton(
                  onPressed: () {
                    const location = 'inside';
                    _makeApiRequest(location);
                  },
                  child: const Text('🏋️'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(150, 70), 
                    textStyle: TextStyle(fontSize: 40), // Increased font size 
                  ),
                  onHover: (value) {
                    print(value);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
