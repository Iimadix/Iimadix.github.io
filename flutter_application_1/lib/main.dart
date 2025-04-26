import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String responseText = 'Нажми кнопку для запроса';

  Future<void> fetchData() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
    final response = await http.get(url);
    setState(() {
      responseText = response.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Test')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Локальное изображение
              Padding(
                padding: EdgeInsets.all(8),
                child: Image.asset('assets/cat.png'),
              ),
              // Кнопка для HTTP-запроса
              ElevatedButton(
                onPressed: fetchData,
                child: Text('Сделать HTTP GET'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(responseText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
