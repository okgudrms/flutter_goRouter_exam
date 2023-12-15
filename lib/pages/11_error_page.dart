import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, required this.error});
  final String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("ERROR"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            const Center(
              child: Text("ERROR PAGE"),
            ),
            Text(error),
            ElevatedButton(
              onPressed: () {
                context.go('/');
              },
              child: const Text(
                "Go Gome",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
