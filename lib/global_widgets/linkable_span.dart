import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LinkableSpan extends WidgetSpan {
  LinkableSpan({
    MouseCursor? mouseCursor,
    required InlineSpan inlineSpan,
  }) : super(
          child: MouseRegion(
            cursor: mouseCursor ?? SystemMouseCursors.click,
            child: Text.rich(
              inlineSpan,
              style: inlineSpan.style,
            ),
          ),
        );
}
