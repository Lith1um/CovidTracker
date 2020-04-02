// Flutter
import 'package:flutter/material.dart';

class LoadingSection extends StatelessWidget {
  final Color color;

  const LoadingSection({this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(color),
      ),
    );
  }
}