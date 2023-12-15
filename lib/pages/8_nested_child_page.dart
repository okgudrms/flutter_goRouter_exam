import 'package:flutter/material.dart';

class NestedChildPage extends StatelessWidget {
  const NestedChildPage({super.key, required this.routeName});
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(routeName),
    );
  }
}
