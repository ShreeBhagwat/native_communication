import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  final methodChannel = const MethodChannel('DIALOG');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Native Communication'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _callNativeCode();
            },
            child: const Text('Call Native'),
          ),
        ],
      ),
    );
  }

  Future _callNativeCode() async {
    const methodName = 'showDialog';
    methodChannel.invokeMethod(methodName, _controller.text);
  }
}
