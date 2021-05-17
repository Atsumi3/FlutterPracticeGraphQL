import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'graphql_client.dart';

class GraphQLHookScope extends HookWidget {
  final Widget child;

  GraphQLHookScope({required this.child});

  @override
  Widget build(BuildContext context) {
    var graphQLClient = useProvider(graphQLClientNotifierProvider);
    return GraphQLProvider(
      client: graphQLClient,
      child: child,
    );
  }
}
