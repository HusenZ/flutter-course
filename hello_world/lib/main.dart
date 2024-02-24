import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mode switcher",
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const MyStateFulWidget(),
    );
  }
}

class MyStateFulWidget extends StatefulWidget {
  const MyStateFulWidget({super.key});

  @override
  State<MyStateFulWidget> createState() => _MyStateFulWidgetState();
}

class _MyStateFulWidgetState extends State<MyStateFulWidget> {
  bool _isDark = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDark ? Colors.purple : Colors.white,
      appBar: AppBar(
        title: const Text("Theme Changer"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            _isDark ? "The app is on dark mode" : "The app is on light mode",
            style: const TextStyle(fontSize: 20),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isDark = !_isDark;
              });
            },
            child: const Text("Switch Mode"),
          ),
        ],
      ),
    );
  }
}
