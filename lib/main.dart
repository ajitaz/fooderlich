import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'navigation/app_router.dart';
import 'providers/providers.dart';
import './theme/fooderlich_theme.dart';

void main() {
  runApp(
    const ProviderScope(
      child: Fooderlich(),
    ),
  );
}

class Fooderlich extends StatefulWidget {
  const Fooderlich({Key? key}) : super(key: key);

  @override
  State<Fooderlich> createState() => _FooderlichState();
}

class _FooderlichState extends State<Fooderlich> {
  late AppRouter _appRouter;
  @override
  void initState() {
    _appRouter = AppRouter(
      appStateManager: context.read(appStateManager),
      groceryManager: context.read(groceryManager),
      profileManager: context.read(profileManager),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      ThemeData theme;
      if (watch(profileManager).darkMode) {
        theme = FooderlichTheme.dark();
      } else {
        theme = FooderlichTheme.light();
      }
      return MaterialApp(
          title: 'Fooderlich',
          theme: theme,
          home: Router(
            routerDelegate: _appRouter,
            backButtonDispatcher: RootBackButtonDispatcher(),
          ));
    });
  }
}
