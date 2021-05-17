import 'package:flutter/material.dart';

import 'repository_list_graphql_builder.dart';
import 'repository_list_item_widget.dart';

class RepositoryListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _build()),
    );
  }

  Widget _build() {
    return repositoryListGraphQLBuilder(
        userName: "DroidKaigi",
        fetchNum: 20,
        onError: (error) => Text("$error"),
        onLoading: () => const Center(
              child: CircularProgressIndicator(),
            ),
        onDone: (items) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return RepositoryListItemWidget(items[index]);
            },
            itemCount: items.length,
          );
        });
  }
}
