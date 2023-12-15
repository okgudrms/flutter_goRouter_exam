import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lio_ga_gorouter/default_laytout.dart';

class PushPage extends StatelessWidget {
  const PushPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Center(
              child: Text("PUSH PAGE"),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.push('/basic');
            },
            child: const Text("Push Basic"),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/basic');
            },
            child: const Text("Go Basic"),
          ),
        ],
      ),
    );
  }
}
