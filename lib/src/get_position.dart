/*
 * Copyright © 2020, Simform Solutions
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';

class GetPosition {
  final GlobalKey? key;
  final BuildContext context;

  GetPosition({this.key, required this.context});

  Rect getRect() {
    final box = key!.currentContext!.findRenderObject() as RenderBox;
    Offset boxGlobal;
    try {
      boxGlobal = box.localToGlobal(
        const Offset(0.0, 0.0),
        ancestor: ShowCaseWidget.of(context)!.coordinateSystemAncestor,
      );
    } catch (e) {
      boxGlobal = box.localToGlobal(const Offset(0.0, 0.0), ancestor: box);
    }

    final topLeft = box.size.topLeft(boxGlobal);
    final bottomRight = box.size.bottomRight(boxGlobal);

    final rect = Rect.fromLTRB(
      topLeft.dx,
      topLeft.dy,
      bottomRight.dx,
      bottomRight.dy,
    );
    return rect;
  }

  ///Get the bottom position of the widget
  double getBottom() {
    final box = key!.currentContext!.findRenderObject() as RenderBox;
    Offset boxGlobal;
    try {
      boxGlobal = box.localToGlobal(
        const Offset(0.0, 0.0),
        ancestor: ShowCaseWidget.of(context)!.coordinateSystemAncestor,
      );
    } catch (e) {
      boxGlobal = box.localToGlobal(const Offset(0.0, 0.0), ancestor: box);
    }
    final bottomRight = box.size.bottomRight(boxGlobal);
    return bottomRight.dy;
  }

  ///Get the top position of the widget
  double getTop() {
    final box = key!.currentContext!.findRenderObject() as RenderBox;
    Offset boxGlobal;
    try {
      boxGlobal = box.localToGlobal(
        const Offset(0.0, 0.0),
        ancestor: ShowCaseWidget.of(context)!.coordinateSystemAncestor,
      );
    } catch (e) {
      boxGlobal = box.localToGlobal(const Offset(0.0, 0.0), ancestor: box);
    }
    final topLeft = box.size.topLeft(boxGlobal);
    return topLeft.dy;
  }

  ///Get the left position of the widget
  double getLeft() {
    final box = key!.currentContext!.findRenderObject() as RenderBox;
    Offset boxGlobal;
    try {
      boxGlobal = box.localToGlobal(
        const Offset(0.0, 0.0),
        ancestor: ShowCaseWidget.of(context)!.coordinateSystemAncestor,
      );
    } catch (e) {
      boxGlobal = box.localToGlobal(const Offset(0.0, 0.0), ancestor: box);
    }
    final topLeft = box.size.topLeft(boxGlobal);
    return topLeft.dx;
  }

  ///Get the right position of the widget
  double getRight() {
    final box = key!.currentContext!.findRenderObject() as RenderBox;
    Offset boxGlobal;
    try {
      boxGlobal = box.localToGlobal(
        const Offset(0.0, 0.0),
        ancestor: ShowCaseWidget.of(context)!.coordinateSystemAncestor,
      );
    } catch (e) {
      boxGlobal = box.localToGlobal(const Offset(0.0, 0.0), ancestor: box);
    }
    final bottomRight = box.size.bottomRight(boxGlobal);
    return bottomRight.dx;
  }

  double getHeight() {
    return getBottom() - getTop();
  }

  double getWidth() {
    return getRight() - getLeft();
  }

  double getCenter() {
    return (getLeft() + getRight()) / 2;
  }
}
