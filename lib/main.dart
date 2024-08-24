import 'package:flutter/material.dart';
import 'package:native_communication/home_screen.dart';

void main() {
  runApp(const NativeCommunication());
}

class NativeCommunication extends StatelessWidget {
  const NativeCommunication({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
