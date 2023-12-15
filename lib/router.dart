import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lio_ga_gorouter/pages/0_go_push_page.dart';
import 'package:lio_ga_gorouter/pages/10_transition_page_1.dart';
import 'package:lio_ga_gorouter/pages/10_transition_page_2.dart';
import 'package:lio_ga_gorouter/pages/11_error_page.dart';
import 'package:lio_ga_gorouter/pages/1_basic_page.dart';
import 'package:lio_ga_gorouter/pages/2_named_page.dart';
import 'package:lio_ga_gorouter/pages/3_push_page.dart';
import 'package:lio_ga_gorouter/pages/4_pop_base_page.dart';
import 'package:lio_ga_gorouter/pages/5_pop_return_page.dart';
import 'package:lio_ga_gorouter/pages/6_path_parm_page.dart';
import 'package:lio_ga_gorouter/pages/7_query_parm_page.dart';
import 'package:lio_ga_gorouter/pages/8_nested_child_page.dart';
import 'package:lio_ga_gorouter/pages/8_nested_page.dart';
import 'package:lio_ga_gorouter/pages/9_login_page.dart';
import 'package:lio_ga_gorouter/pages/9_private_page.dart';
import 'package:lio_ga_gorouter/root_page.dart';

bool authState = false;

/// route 정리
/// '/' : root_page
/// '/basic' : basic_page
/// '/named' : named_page
final router = GoRouter(
  redirect: (context, state) {
    if (state.uri.path == '/login/private' && !authState) {
      return '/login';
    }
    return null;
  },
  errorBuilder: (context, state) => ErrorPage(
    error: state.error.toString(),
  ),
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const RootPage();
      },
      routes: [
        GoRoute(
          path: 'basic',
          builder: (context, state) {
            return const BasicPage();
          },
        ),
        GoRoute(
          path: 'named',
          name: 'named_page',
          builder: (context, state) {
            return const NamedPage();
          },
        ),
        GoRoute(
          path: 'push',
          builder: (context, state) {
            return const PushPage();
          },
        ),
        GoRoute(
          path: 'pop',
          builder: (context, state) {
            return const PopBasePage();
          },
          routes: [
            GoRoute(
              path: 'return',
              builder: (context, state) {
                return const PopReturnPage();
              },
            ),
          ],
        ),
        GoRoute(
          path: 'path_parm/:id',
          builder: (context, state) {
            return const PathParmPage();
          },
          routes: [
            GoRoute(
              path: ':name',
              builder: (context, state) {
                return const PathParmPage();
              },
            )
          ],
        ),
        GoRoute(
          path: 'query_parm',
          builder: (context, state) {
            return const QueryParmPage();
          },
        ),
        ShellRoute(
          routes: [
            GoRoute(
              path: 'nested/A',
              builder: (context, state) =>
                  const NestedChildPage(routeName: 'nested/A'),
            ),
            GoRoute(
              path: 'nested/B',
              builder: (context, state) =>
                  const NestedChildPage(routeName: 'nested/B'),
            ),
            GoRoute(
              path: 'nested/C',
              builder: (context, state) =>
                  const NestedChildPage(routeName: 'nested/C'),
            ),
          ],
          builder: (context, state, child) {
            return NestedPage(child: child);
          },
        ),
        GoRoute(
          path: 'login',
          builder: (context, state) => const LoginPage(),
          routes: [
            GoRoute(
              path: 'private',
              builder: (context, state) => const PrivatePage(),
            ),
          ],
        ),
        GoRoute(
          path: 'login2',
          builder: (context, state) => const LoginPage(),
          routes: [
            GoRoute(
              path: 'private',
              builder: (context, state) => const PrivatePage(),
              redirect: (context, state) {
                if (!authState) {
                  return '/login2';
                }
                return null;
              },
            ),
          ],
        ),
        GoRoute(
            path: 'transition',
            builder: (context, state) => const TransitionPageOne(),
            routes: [
              GoRoute(
                path: 'detail',
                pageBuilder: (context, state) => CustomTransitionPage(
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: const TransitionPageTwo(),
                ),
                // builder: (context, state) => const TransitionPageTwo(),
              ),
            ]),
      ],
    ),
    GoRoute(
      path: '/gopush',
      builder: (context, state) {
        return const GoPushPage();
      },
    ),
  ],
);
