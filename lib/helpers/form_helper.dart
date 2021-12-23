import 'package:division/division.dart';
import 'package:flutter/material.dart';

import 'ui_utils.dart';

enum FormActionsMode { both, conformation, cancel }

abstract class FormHelper {
  static Widget buildButton({
    required String label,
    required VoidCallback onPressed,
    required Color color,
    bool enabled = true,
    bool isLoading = false,
    bool outlined = false,
    double? height,
  }) {
    return Parent(
      style: ParentStyle()
        ..margin(horizontal: 10, vertical: 5)
        ..height(height ?? 50)
        ..boxShadow(
          color: color.withOpacity(.3),
          offset: const Offset(.5, .5),
          blur: 10.5,
          spread: 1.3,
        )
        ..border(color: color, all: 1)
        ..ripple(enabled)
        ..opacity(enabled ? 1 : .5)
        ..borderRadius(all: 10)
        ..alignmentContent.center()
        ..background.color(
            outlined ? UiUtils.getWhiteColorWithBrightness(null) : color),
      gesture: Gestures()
        ..onTap(
          () {
            if (!isLoading && enabled) onPressed();
          },
        ),
      child: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: outlined ? color : Colors.white,
              ),
            )
          : () {
              return Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: outlined ? color : Colors.white,
                  fontWeight: FontWeight.w900,
                ),
              );
            }(),
    );
  }
}
