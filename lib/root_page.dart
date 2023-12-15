import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lio_ga_gorouter/default_laytout.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  void initState() {
    print("RootPage init");
    super.initState();
  }

  @override
  void dispose() {
    print("RootPage disopse");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      // title: "루트 페이지",
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Center(
              child: Text("ROOT PAGE"),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/basic');
            },
            child: const Text("Go Basic"),
          ),
          ElevatedButton(
            onPressed: () {
              context.goNamed('named_page');
            },
            child: const Text("Go Named"),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/push');
            },
            child: const Text("Go Push"),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/pop');
            },
            child: const Text("Go Pop"),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/path_parm/456');
            },
            child: const Text("Go Path Parm"),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/query_parm');
            },
            child: const Text("Go Query Parm"),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/nested/A');
            },
            child: const Text("Go Nested"),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/login');
            },
            child: const Text("Go Login"),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/login2');
            },
            child: const Text("Go Login2"),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/transition');
            },
            child: const Text("Go Transition"),
          ),
          ElevatedButton(
            onPressed: () {
              context.go('/error');
            },
            child: const Text("Go Error"),
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  context.push('/gopush');
                },
                child: const Text("Push GoPush"),
              ),
              ElevatedButton(
                onPressed: () {
                  context.go('/gopush');
                },
                child: const Text("Go GoPush"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
