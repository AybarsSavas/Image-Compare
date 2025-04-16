import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class ImagePreviewWidget extends StatelessWidget {
  final ui.Image? image;
  final String label;

  const ImagePreviewWidget({
    required this.image,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 16)),
        const SizedBox(height: 10),
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(border: Border.all()),
          child: image != null
              ? RawImage(
                  image: image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                )
              : const Center(
                  child: Text(
                    'No image',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
        ),
      ],
    );
  }
}
