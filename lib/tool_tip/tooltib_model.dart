import 'package:flutter/material.dart';

class TooltipData {
  final String message;
  final GlobalKey globalKey;
  final Offset position;
  final String key;


  TooltipData(this.message,
   this.globalKey,
   this.position,this.key);
}
