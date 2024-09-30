import 'package:flutter/material.dart';
import 'health_record_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Healthcare DApp'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Manage Health Records'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HealthRecordScreen()),
            );
          },
        ),
      ),
    );
  }
}
