import 'package:flutter/material.dart';
import 'package:long_press_animation_button/long_press_animation_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Long Press Animation Button',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      home: const MyHomePage(title: 'Long Press Animation Button'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 12,
          children: [
            LongPressAnimationButton(
              text: 'Long Press 1',
              onLongPress: () => print('Click !!!'),
            ),

            LongPressAnimationButton(
              text: 'Long Press 2',
              onTap: () => print('Tap'),
              onLongPress: () => print('Click !!!'),
              backgroundColor: Colors.tealAccent,
              loadingColor: Colors.yellow,
              borderRadius: 12,
              border: Border.all(width: 4, color: Colors.orange),

              height: 80,
              width: 200,
              textStyle: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.brown,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
