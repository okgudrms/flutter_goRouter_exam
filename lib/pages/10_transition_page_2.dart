import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lio_ga_gorouter/default_laytout.dart';

class TransitionPageTwo extends StatelessWidget {
  const TransitionPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          const Center(
            child: Text("TRANSITION2 PAGE"),
          ),
          ElevatedButton(
            onPressed: () {
              context.pop();
            },
            child: const Text(
              "Pop",
            ),
          ),
        ],
      ),
    );
  }
}
