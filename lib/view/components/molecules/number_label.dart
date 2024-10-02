import 'package:flutter/material.dart';

class NumberLabel extends StatelessWidget {
  final int number;
  final IconData icon;

  const NumberLabel({
    super.key,
    required this.number,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon),
            Padding(
                padding: const EdgeInsets.all(2),
                child: Text(
                  number.toString(),
                )),
          ],
        ));
  }
}
