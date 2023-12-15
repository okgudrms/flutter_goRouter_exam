import 'package:flutter/material.dart';
import 'package:lio_ga_gorouter/default_laytout.dart';

class PrivatePage extends StatelessWidget {
  const PrivatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Center(
              child: Text("PRIVATE PAGE"),
            ),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     // context.go('/login/private');
          //   },
          //   child: const Text(
          //     "Go Private",
          //   ),
          // ),
        ],
      ),
    );
  }
}
