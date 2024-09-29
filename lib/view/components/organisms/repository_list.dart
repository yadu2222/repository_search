import 'package:flutter/material.dart';
import 'package:repository_search/data/models/repository_model.dart';
import '../atoms/list_item.dart';
import '../molecules/repository_card.dart';

class RepositoryList extends StatelessWidget {
  const RepositoryList({
    super.key,
    required this.repositories,
  });

  final List<Repository> repositories;

  @override
  Widget build(BuildContext context) {
    return ListItemBox<Repository>(
      itemDatas: repositories,
      listItem: (Repository repository) {
        return RepositoryCard(repository: repository);
      },
    );
  }
}