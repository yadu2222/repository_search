import 'package:flutter/material.dart';

class OwnerImage extends StatelessWidget {
  const OwnerImage({
    super.key,
    required this.imageUrl,
    this.size = 50,
  });
  final String imageUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network(
        imageUrl,
        width: size,
        height: size,
        fit: BoxFit.cover,
      ),
    );
  }
}
