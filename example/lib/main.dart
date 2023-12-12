import 'package:flutter/material.dart';
import 'package:number_words_reader/number_words_reader.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Number Words Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Convert the number 4500 to Arabic words:',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                NumberWordsReader.convertToArabic(4500),
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              const Text(
                'Convert the number 4500 to English words:',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              Text(
                NumberWordsReader.convertToEnglish(4500),
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
