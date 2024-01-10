import 'package:flutter/material.dart';

class firstpage extends StatefulWidget {
  const firstpage({super.key});

  @override
  State<firstpage> createState() => _firstpageState();
}

class _firstpageState extends State<firstpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text('data'),
            TextButton.icon(
              icon: const Icon(Icons.male, size: 18),
              label: Text("ชาย"),
              onPressed: null,
            ),
            TextButton.icon(
              icon: const Icon(Icons.female, size: 18),
              label: Text("ชาย"),
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }
}
