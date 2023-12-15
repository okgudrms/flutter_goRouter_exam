import 'package:flutter/material.dart';
import 'package:lio_ga_gorouter/default_laytout.dart';

class NamedPage extends StatelessWidget {
  const NamedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      body: Center(
        child: Text("NAMED PAGE"),
      ),
    );
  }
}
