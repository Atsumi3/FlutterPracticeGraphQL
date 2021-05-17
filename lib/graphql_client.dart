import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GraphQLClientNotifier extends ValueNotifier<GraphQLClient> {
  GraphQLClientNotifier(GraphQLClient client) : super(client);
}

final _graphQLClient = GraphQLClient(
    link: HttpLink("https://api.github.com/graphql"),
    cache: GraphQLCache(store: HiveStore()));

final graphQLClientNotifierProvider =
    Provider((_) => GraphQLClientNotifier(_graphQLClient));
