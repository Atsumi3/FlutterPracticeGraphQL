import 'package:flutter/material.dart';

import 'repository_list_item_model.dart';

class RepositoryListItemWidget extends StatelessWidget {
  final RepositoryListItemModel _model;

  const RepositoryListItemWidget(RepositoryListItemModel model)
      : _model = model,
        super();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [Text(_model.repositoryName)],
          ),
        ),
      ),
    );
  }
}
