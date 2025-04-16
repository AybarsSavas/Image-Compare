import 'package:flutter/material.dart';
import 'package:image_compare/features/image_compare/ui/provider/image_compare_provider.dart';
import 'package:image_compare/features/image_compare/ui/widgets/image_preview_widget.dart';
import 'package:provider/provider.dart';

class ImageCompareScreen extends StatelessWidget {
  const ImageCompareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ImageCompareProvider>();
    final similarity = provider.similarity;
    const double fontSize = 16;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Compare'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ImagePreviewWidget(image: provider.image1, label: 'Image 1'),
                ImagePreviewWidget(image: provider.image2, label: 'Image 2'),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => provider.pickImage(1),
                  child: const Text(
                    'Select image 1',
                    style: TextStyle(fontSize: fontSize),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => provider.pickImage(2),
                  child: const Text(
                    'Select image 2',
                    style: TextStyle(fontSize: fontSize),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: provider.image1 != null && provider.image2 != null
                  ? provider.compareImages
                  : null,
              child:
                  const Text('Compare', style: TextStyle(fontSize: fontSize)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: provider.reset,
              child: const Text('Reset', style: TextStyle(fontSize: fontSize)),
            ),
            const SizedBox(height: 20),
            if (similarity != null)
              Text(
                'Similarity: ${(similarity * 100).toStringAsFixed(2)}%',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}
