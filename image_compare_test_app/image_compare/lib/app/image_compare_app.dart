import 'package:flutter/material.dart';
import 'package:image_compare/features/image_compare/ui/provider/image_compare_provider.dart';
import 'package:image_compare/features/image_compare/ui/screens/image_compare_screen.dart';
import 'package:provider/provider.dart';

class ImageCompareApp extends StatelessWidget {
  const ImageCompareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ImageCompareProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Image Compare',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ImageCompareScreen(),
      ),
    );
  }
}
