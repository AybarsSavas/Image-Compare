import 'dart:typed_data';
import 'dart:ui' as ui;

class ImageComparator {
  static const int bytesPerPixel = 4;
  static Future<double> compareImages(ui.Image image1, ui.Image image2) async {
    if (image1.width != image2.width || image1.height != image2.height) {
      return 0.0;
    }

    final ByteData? bytes1 = await image1.toByteData();
    final ByteData? bytes2 = await image2.toByteData();

    if (bytes1 == null || bytes2 == null) return 0.0;

    int differentPixels = 0;
    final int totalPixels = image1.width * image1.height;

    for (int i = 0; i < bytes1.lengthInBytes; i += bytesPerPixel) {
      for (int j = 0; j < bytesPerPixel; j++) {
        if (bytes1.getUint8(i + j) != bytes2.getUint8(i + j)) {
          differentPixels++;
          break;
        }
      }
    }

    final double similarity = 1.0 - (differentPixels / totalPixels);

    return similarity.clamp(0.0, 1.0);
  }
}
