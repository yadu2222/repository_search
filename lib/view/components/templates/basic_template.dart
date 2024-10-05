import 'package:flutter/material.dart';
import '../../components/atoms/app_bar.dart';

// appbar + Column
class BasicTemplate extends StatelessWidget {
  final String title;
  final bool popIcon;
  final List<Widget> children;
  final IconButton? featureIconButton;
  final bool portrait; // 縦かどうか

  const BasicTemplate({super.key, required this.title, this.popIcon = false, required this.children, this.featureIconButton,this.portrait = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarView(
          titleText: title,
          featureIconButton: featureIconButton,
        ), // ,
        body: Center(
            child: portrait
                ? Column(children: [
                    ...children,
                  ])
                : Row(children: [
                    ...children,
                  ])));
  }
}
