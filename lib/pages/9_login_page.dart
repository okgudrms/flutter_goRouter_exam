import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lio_ga_gorouter/default_laytout.dart';
import 'package:lio_ga_gorouter/router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Center(
              child: Text("LOGIN PAGE"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Center(
              child: Text("$authState"),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                authState = !authState;
              });
            },
            child: Text(authState ? 'logout' : 'login'),
          ),
          ElevatedButton(
            onPressed: () {
              print(GoRouterState.of(context).uri.path);
              if (GoRouterState.of(context).uri.path == '/login') {
                print('1');
                context.go('/login/private');
              } else {
                print('2');
                context.go('/login2/private');
              }
            },
            child: const Text(
              "Go Private",
            ),
          ),
        ],
      ),
    );
  }
}
