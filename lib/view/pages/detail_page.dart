import 'package:flutter/material.dart';
import 'package:repository_search/data/models/repository_model.dart';
import 'package:repository_search/view/components/atoms/image_icon.dart';
import 'package:repository_search/view/components/molecules/number_label.dart';
import '../components/templates/basic_template.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key, required this.repository});

  final Repository repository;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait

        // 縦向き
        ? BasicTemplate(
            title: '詳細',
            children: [
              OwnerImage(imageUrl: repository.repositoryOwner),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // スター数
                  NumberLabel(number: repository.numberOfStars, icon: Icons.star),
                  // フォーク数
                  NumberLabel(
                    number: repository.numberOfForks,
                    icon: Icons.fork_left,
                  ),
                  // ウォッチ数
                  NumberLabel(
                    number: repository.numberOfWatchers,
                    icon: Icons.remove_red_eye,
                  ),
                ],
              ),
              Text(repository.langage), // 言語
              Text(repository.repositoryName), // リポジトリ名
            ],
          )
        // 横向き
        : BasicTemplate(
            title: '詳細',
            portrait: false,
            children: [
              Padding(padding: const EdgeInsets.all(40), child: Column(children: [OwnerImage(imageUrl: repository.repositoryOwner)])),
              Column(children: [
                Text(repository.repositoryName), // リポジトリ名
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // スター数
                    NumberLabel(number: repository.numberOfStars, icon: Icons.star),
                    // フォーク数
                    NumberLabel(
                      number: repository.numberOfForks,
                      icon: Icons.fork_left,
                    ),
                    // ウォッチ数
                    NumberLabel(
                      number: repository.numberOfWatchers,
                      icon: Icons.remove_red_eye,
                    ),
                  ],
                ),
                Text(repository.langage), // 言語
              ])
            ],
          );
  }
}
