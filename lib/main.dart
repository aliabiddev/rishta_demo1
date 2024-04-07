import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'dart:convert';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://pzmrfcsdphwlmqvfxotn.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InB6bXJmY3NkcGh3bG1xdmZ4b3RuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTEzODE5NDUsImV4cCI6MjAyNjk1Nzk0NX0.Ch8KjHfT_0RaN9_XH7Aq67hBDfaNccby1P09ENSgOPE',
  );
 // runApp(const MyApp());
  runApp(MaterialApp(
    home: MyApp(),
    theme: ThemeData(primarySwatch: Colors.blue),
  ));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Supabase Demo'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              final supabase = Supabase.instance;
              final response = await supabase.client.from('table1').select('*');
              print(response);
              final data = response[0]['data']; // Access data from the first row and a specific column
              print("#############my stuff");
              print(data);

              // Convert data to JSON string
              final jsonData = jsonEncode(data);

              // Display JSON data on the screen
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Data in JSON format'),
                    content: Text(jsonData),
                  );
                },
              );
            },
            child: const Text('Fetch Records'),
          ),
        ),
      ),
    );
  }
}