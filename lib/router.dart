import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lio_ga_gorouter/custom_navigation_observer.dart';
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

final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

/// route 정리
/// '/' : root_page
/// '/basic' : basic_page
/// '/named' : named_page
final router = GoRouter(
  observers: [
    // CustomNavigationObserver(analytics: analytics),
    FirebaseAnalyticsObserver(
      analytics: analytics,
      nameExtractor: (settings) {
        switch (settings.name) {
          case 'path_parm/:id':
            {
              return (settings.arguments as Map<String, String>)['id'];
            }
          case ':name':
            {
              return (settings.arguments as Map<String, String>)['name'];
            }
        }
      },
    )
  ],
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
      name: 'home',
      path: '/',
      builder: (context, state) {
        return const RootPage();
      },
      routes: [
        GoRoute(
          name: 'basic',
          path: 'basic',
          builder: (context, state) {
            return const BasicPage();
          },
        ),
        GoRoute(
          path: 'named_page',
          name: 'named_page',
          builder: (context, state) {
            return const NamedPage();
          },
        ),
        GoRoute(
          name: "push",
          path: 'push',
          builder: (context, state) {
            return const PushPage();
          },
        ),
        GoRoute(
          name: 'pop',
          path: 'pop',
          builder: (context, state) {
            return const PopBasePage();
          },
          routes: [
            GoRoute(
              name: 'return',
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
            FirebaseAnalytics.instance.logScreenView(
              screenClass: "Flutter",
              screenName: "path_parm/${state.pathParameters['id']}",
            );

            return const PathParmPage();
          },
          routes: [
            GoRoute(
              path: ':name',
              builder: (context, state) {
                // FirebaseAnalytics.instance.logScreenView(
                //   screenClass: "Flutter",
                //   screenName:
                //       "path_parm/${state.pathParameters['id']}/${state.pathParameters['name']}",
                // );
                return const PathParmPage2();
              },
            )
          ],
        ),
        GoRoute(
          name: 'query_parm',
          path: 'query_parm',
          builder: (context, state) {
            return const QueryParmPage();
          },
        ),
        ShellRoute(
          routes: [
            GoRoute(
              name: 'nested/A',
              path: 'nested/A',
              builder: (context, state) =>
                  const NestedChildPage(routeName: 'nested/A'),
            ),
            GoRoute(
              name: 'nested/B',
              path: 'nested/B',
              builder: (context, state) =>
                  const NestedChildPage(routeName: 'nested/B'),
            ),
            GoRoute(
              name: 'nested/C',
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
          name: 'login',
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
          name: 'login2',
          path: 'login2',
          builder: (context, state) => const LoginPage(),
          routes: [
            GoRoute(
              name: 'private',
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
            name: 'transition',
            path: 'transition',
            builder: (context, state) => const TransitionPageOne(),
            routes: [
              GoRoute(
                name: 'detail',
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
      name: '/gopush',
      path: '/gopush',
      builder: (context, state) {
        return const GoPushPage();
      },
    ),
  ],
);
