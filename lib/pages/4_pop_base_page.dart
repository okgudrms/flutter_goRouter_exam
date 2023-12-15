import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lio_ga_gorouter/default_laytout.dart';

class PopBasePage extends StatefulWidget {
  const PopBasePage({super.key});

  @override
  State<PopBasePage> createState() => _PopBasePageState();
}

class _PopBasePageState extends State<PopBasePage> {
  @override
  void initState() {
    print("PopBasePage init");
    super.initState();
  }

  @override
  void dispose() {
    print("PopBasePage dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Center(
              child: Text("POP BASE PAGE"),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/pop/return');
            },
            child: Text(
              "Go PopReturn",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/basic');
            },
            child: Text(
              "Go Basic",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/gopush');
            },
            child: Text(
              "Go GoPush",
            ),
          ),
        ],
      ),
    );
  }
}
