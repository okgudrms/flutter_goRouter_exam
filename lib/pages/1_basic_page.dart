import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lio_ga_gorouter/default_laytout.dart';

class BasicPage extends StatefulWidget {
  const BasicPage({super.key});

  @override
  State<BasicPage> createState() => _BasicPageState();
}

class _BasicPageState extends State<BasicPage> {
  @override
  void initState() {
    print("BasicPage init");
    super.initState();
  }

  @override
  void dispose() {
    print("BasicPage dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          const Center(
            child: Text("BASIC PAGE"),
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
