import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lio_ga_gorouter/default_laytout.dart';

class PopReturnPage extends StatelessWidget {
  const PopReturnPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Center(
              child: Text("POP RETURN PAGE"),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              "Pop",
            ),
          ),
        ],
      ),
    );
  }
}
