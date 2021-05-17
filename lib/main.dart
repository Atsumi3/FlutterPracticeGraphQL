import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'graphql_hook_scope.dart';
import 'ui/repository_list/repository_list_page.dart';

void main() async {
  await initHiveForFlutter();
  runApp(ProviderScope(
      child: GraphQLHookScope(
    child: MyApp(),
  )));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RepositoryListPage(),
    );
  }
}
