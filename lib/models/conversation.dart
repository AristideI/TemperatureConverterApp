import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Conversion {
  final String type;
  final double value;
  final double convertedValue;
  final String currentOption;
  final String id;

  Conversion({
    Key? key,
    required this.type,
    required this.value,
    required this.convertedValue,
    required this.currentOption,
  }) : id = const Uuid().v4();

  String get text => '$currentOption: $value -> $convertedValue';
}
