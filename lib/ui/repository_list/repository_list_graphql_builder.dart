import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../data/remote/graphql/query/read_repositories.dart';
import 'repository_list_item_model.dart';

Widget repositoryListGraphQLBuilder(
    {required String userName,
    required int fetchNum,
    required Widget Function(Exception?) onError,
    required Widget Function() onLoading,
    required Widget Function(List<RepositoryListItemModel>) onDone}) {
  return Query(
      options:
          QueryOptions(document: gql(readRepositories(userName, fetchNum))),
      builder: (result, {refetch, fetchMore}) {
        if (result.hasException) {
          return onError(result.exception);
        }
        if (result.isLoading) {
          return onLoading();
        }
        if (result.data == null) {
          return onLoading();
        }
        final repositories = result.data!['search']['nodes'] as List;
        final itemModelList = repositories
            .where((element) => element != null)
            .map((e) => RepositoryListItemModel(
                repositoryName: e["name"], stargazerCount: e["stargazerCount"]))
            .toList();
        return onDone(itemModelList);
      });
}
