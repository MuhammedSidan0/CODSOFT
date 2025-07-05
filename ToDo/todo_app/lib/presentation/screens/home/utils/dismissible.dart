 import 'package:flutter/material.dart';

Widget dismissBg(Alignment alignment, IconData icon, Color color) {
  return Container(
    alignment: alignment,
    color: color.withOpacity(0.85),
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Icon(icon, color: Colors.white, size: 28),
  );
}