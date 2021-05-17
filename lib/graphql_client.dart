import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class GraphQLFlutterClient extends ValueNotifier<GraphQLClient> {
  GraphQLFlutterClient(HttpLink httpLink, AuthLink authLink)
      : super(GraphQLClient(
            link: authLink.concat(httpLink),
            cache: GraphQLCache(store: HiveStore())));
}

final _httpLink = HttpLink("https://api.github.com/graphql");

final _authLink = AuthLink(
    getToken: () => 'Bearer ${const String.fromEnvironment("GITHUB_PAT")}');

final graphQLProvider =
    Provider((_) => GraphQLFlutterClient(_httpLink, _authLink));
