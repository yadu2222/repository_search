import 'package:flutter/material.dart';
import '../../components/atoms/app_bar.dart';

// appbar + Column
class BasicTemplate extends StatelessWidget {
  final String title;
  final bool popIcon;
  final List<Widget> children;
  final IconButton? featureIconButton;
  final bool Function()? popFunction;

  const BasicTemplate({super.key, required this.title, this.popIcon = false, required this.children, this.featureIconButton, this.popFunction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarView(
          titleText: title,
          popIconButton: popIcon,
          featureIconButton: featureIconButton,
          popFunction: popFunction,
        ), // ,
        body: Center(
            child: Column(children: [
          ...children,
        ])));
  }
}
