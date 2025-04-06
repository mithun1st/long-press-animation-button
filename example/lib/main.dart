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
  String _text = 'ready for checkout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              _text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            // LongPressAnimationButton(
            //   onLongPress: () => print('Click !'),
            //   child: Text("Animation Button"),
            // ),

            LongPressAnimationButton(
              onTap:
                  () => setState(() {
                    _text = 'Long Press To Checkout.\n-- onTap() --';
                  }),
              onLongPressCancel:
                  () => setState(() {
                    _text = 'Checkout Cancel !\n-- onLongPressCancel() --';
                  }),
              onLongPress:
                  () => setState(() {
                    _text = 'CHECKOUT SUCCESS :)\n-- onLongPress() --';
                  }),

              height: 80,
              width: 200,
              backgroundColor: Colors.tealAccent,
              loadingColor: Colors.yellow,
              borderRadius: 12,
              border: Border.all(width: 4, color: Colors.orange),
              durationAsSecond: 4,

              child: Text(
                'Checkout',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
