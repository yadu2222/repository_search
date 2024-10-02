import 'package:flutter/material.dart';
import 'package:repository_search/core/constans/fonts.dart';
import 'package:repository_search/data/models/repository_model.dart';
import 'package:repository_search/view/components/atoms/image_icon.dart';
import 'package:repository_search/view/components/molecules/number_label.dart';
import '../components/templates/basic_template.dart';
import 'package:url_launcher/url_launcher.dart';

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
              InkWell(
                  // タップでオーナーのページに遷移
                  onTap: () {
                    launchUrl(Uri.parse(repository.ownerUrl));
                  },
                  child: OwnerImage(imageUrl: repository.repositoryOwner)),
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
              Row(mainAxisSize: MainAxisSize.min, children: [
                const Icon(Icons.language),
                Text(
                  repository.langage == '' ? '不明' : repository.langage,
                  style: Fonts.p,
                ),
              ]),

              InkWell(
                  onTap: () {
                    launchUrl(Uri.parse(repository.repositoryUrl));
                  },
                  child: Text(repository.repositoryName, style: Fonts.link)), // リポジトリ名
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
