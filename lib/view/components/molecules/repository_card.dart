import 'package:flutter/material.dart';
import 'package:repository_search/core/constans/fonts.dart';
import 'package:repository_search/data/models/repository_model.dart';

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
      height: 100,
      widget: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image:  DecorationImage(
                image: NetworkImage(repository.repositoryOwner),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(repository.repositoryName, style: Fonts.p),
              
            ],
          ),
        ],
      ),
    );
  }
}
