import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lio_ga_gorouter/default_laytout.dart';

class TransitionPageOne extends StatelessWidget {
  const TransitionPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          const Center(
            child: Text("TRANSITION1 PAGE"),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/transition/detail');
            },
            child: const Text(
              "Go Detail",
            ),
          ),
        ],
      ),
    );
  }
}
