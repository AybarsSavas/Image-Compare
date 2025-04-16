import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:image_compare/core/utils/image_comparator.dart';
import 'package:image_picker/image_picker.dart';

class ImageCompareProvider with ChangeNotifier {
  ui.Image? _image1;
  ui.Image? _image2;
  double? _similarity;

  ui.Image? get image1 => _image1;
  ui.Image? get image2 => _image2;
  double? get similarity => _similarity;

  Future<void> pickImage(int index) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      final codec = await ui.instantiateImageCodec(bytes);
      final frame = await codec.getNextFrame();

      if (index == 1) {
        _image1 = frame.image;
      } else {
        _image2 = frame.image;
      }

      notifyListeners();
    }
  }

  Future<void> compareImages() async {
    final image1 = _image1;
    final image2 = _image2;

    if (image1 == null || image2 == null) return;

    _similarity = await ImageComparator.compareImages(image1, image2);
    notifyListeners();
  }

  void reset() {
    _image1 = null;
    _image2 = null;
    _similarity = null;
    notifyListeners();
  }
}
