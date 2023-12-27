import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lio_ga_gorouter/default_laytout.dart';

class PathParmPage extends StatelessWidget {
  const PathParmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Center(
              child: Text(
                  "PAHT PARM PAGE : ${GoRouterState.of(context).pathParameters}"),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.push('/path_parm/456/liomo');
            },
            child: Text(
              "Go Path Parm2",
            ),
          ),
        ],
      ),
    );
  }
}

class PathParmPage2 extends StatelessWidget {
  const PathParmPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Center(
              child: Text(
                  "PAHT PARM PAGE2 : ${GoRouterState.of(context).pathParameters}"),
            ),
          ),
          // ElevatedButton(
          //   onPressed: () {
          //     context.go('/path_parm/456/liomo');
          //   },
          //   child: Text(
          //     "Go Path Parm2",
          //   ),
          // ),
        ],
      ),
    );
  }
}
