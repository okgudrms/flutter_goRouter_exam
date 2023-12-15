import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// class NestedPage2 extends StatelessWidget {
//   const NestedPage2({super.key, required this.child});
//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(GoRouterState.of(context).matchedLocation),
//       ),
//       body: child,
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: getCurrentPageIndex(context),
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'person',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.notifications),
//             label: 'notifications',
//           ),
//         ],
//         onTap: (value) {
//           if (value == 0) {
//             context.go('/nested/A');
//           } else if (value == 1) {
//             context.go('/nested/B');
//           } else {
//             context.go('/nested/C');
//           }
//         },
//       ),
//     );
//   }

//   int getCurrentPageIndex(BuildContext context) {
//     if (GoRouterState.of(context).matchedLocation == '/nested/A') {
//       return 0;
//     } else if (GoRouterState.of(context).matchedLocation == '/nested/B') {
//       return 1;
//     } else {
//       return 2;
//     }
//   }
// }

class NestedPage extends StatefulWidget {
  final Widget child;
  const NestedPage({super.key, required this.child});

  @override
  State<NestedPage> createState() => _NestedPageState();
}

class _NestedPageState extends State<NestedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(GoRouterState.of(context).uri.path),
      ),
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        // selectedItemColor: Colors.amber,
        currentIndex: getCurrentPageIndex(context),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'person',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'notifications',
          ),
        ],
        onTap: (value) {
          if (value == 0) {
            context.go('/nested/A');
          } else if (value == 1) {
            context.go('/nested/B');
          } else {
            context.go('/nested/C');
          }
        },
      ),
    );
  }

  int getCurrentPageIndex(BuildContext context) {
    if (GoRouterState.of(context).matchedLocation == 'nested/A') {
      return 0;
    } else if (GoRouterState.of(context).matchedLocation == 'nested/B') {
      return 1;
    } else {
      return 2;
    }
  }
}
