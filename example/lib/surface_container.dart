import 'package:flutter/material.dart';

class SurfaceContainer extends StatelessWidget {
  final Widget child;

  const SurfaceContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(child: child),
    );
  }
}
