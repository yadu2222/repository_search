import 'package:flutter/material.dart';
import 'package:repository_search/data/models/repository_model.dart';
import '../components/templates/basic_template.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key,required this.repository});

  final Repository repository;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait

        // 縦向き
        ? BasicTemplate(
            title: '詳細',
            children: [
              
              Text(repository.repositoryName),
            ],
          )
        // 横向き
        : BasicTemplate(
            title: '詳細',
            portrait: false,
            children: [
               Text(repository.repositoryName),
            ],
          );
  }
}
