import 'package:flutter/material.dart';
import 'package:repository_search/core/constans/fonts.dart';
import 'package:repository_search/data/models/repository_model.dart';
// import 'package:repository_search/view/components/atoms/image_icon.dart';

import '../atoms/card_item.dart';

class RepositoryCard extends StatelessWidget {
  const RepositoryCard({
    super.key,
    required this.repository,
  });

  final Repository repository;

  @override
  Widget build(BuildContext context) {
    return CardItem(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(5),
      widget: Text(
        repository.repositoryName,
        style: Fonts.p,
        overflow: TextOverflow.ellipsis, // テキストが親要素を超えた場合の表示
      ),
    );
  }
}
