import 'package:flutter/material.dart';
import 'package:temperature_converter_app/models/conversation.dart';

class ConversionBook extends ValueNotifier<List<Conversion>> {
  ConversionBook._sharedInstance() : super([]);
  static final ConversionBook _shared = ConversionBook._sharedInstance();
  factory ConversionBook() => _shared;

  int get length => value.length;

  void add({required Conversion conversion}) {
    final conversions = value;
    conversions.add(conversion);
    notifyListeners();
  }

  Conversion? conversion({required int atIndex}) {
    return value.length > atIndex ? value[atIndex] : null;
  }
}
