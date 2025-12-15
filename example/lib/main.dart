import 'package:flutter/material.dart';
import 'package:window_size_classes/window_size_classes.dart';

import 'helper.dart';
import 'surface_container.dart';

void main() => runApp(const ExampleApp());

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(home: Example());
}

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Window*Class.of(context) is also available
    final (widthClass, heightClass) = WindowSizeClass.of(context);

    final WindowWidthClass(:spacing, :fixedPaneWidth) = widthClass;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      // Use Dart 3.10's dot shorthands for even terser code.
      appBar: heightClass != .compact
          ? AppBar(title: Text('Window Size Classes'))
          : null,
      // Add padding to the body that matches the class' spacing and the
      // system's view padding.
      body: Padding(
        padding: maxEdgeInsets(
          EdgeInsets.all(spacing),
          MediaQuery.viewPaddingOf(context),
        ),
        child: Row(
          spacing: spacing,
          children: [
            // Show a fixed-width pane if the screen is wide enough.
            if (fixedPaneWidth != null)
              SizedBox(
                width: fixedPaneWidth,
                child: SurfaceContainer(
                  child: Center(child: Text(fixedPaneWidth.toString())),
                ),
              ),
            Expanded(
              child: SurfaceContainer(
                child: Center(
                  // Show the window size class name.
                  child: Text(
                    'Width class: ${widthClass.name}\n'
                    'Height class: ${heightClass.name}',
                    style: theme.textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
