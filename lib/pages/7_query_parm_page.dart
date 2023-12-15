import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lio_ga_gorouter/default_laytout.dart';

class QueryParmPage extends StatefulWidget {
  const QueryParmPage({super.key});

  @override
  State<QueryParmPage> createState() => _QueryParmPageState();
}

class _QueryParmPageState extends State<QueryParmPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Center(
              child: Text("QUERY PARM PAGE"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Center(
              child:
                  Text("Query Param: ${GoRouterState.of(context).uri.query}"),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.go(
                Uri(
                  path: '/query_parm',
                  queryParameters: {
                    'name': "momo",
                    'age': "33",
                  },
                ).toString(),
              );
            },
            child: const Text(
              "Query Parameter ",
            ),
          ),
        ],
      ),
    );
  }
}
