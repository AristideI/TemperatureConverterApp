import 'package:flutter/material.dart';
import 'package:temperature_converter_app/conversation_radio_options.dart';

class ConversionHeader extends StatelessWidget {
  const ConversionHeader({
    super.key,
    required this.conversionOption,
    required this.currentOption,
    required this.onOptionChanged,
  });

  final List<String> conversionOption;
  final String currentOption;
  final ValueChanged<String> onOptionChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Conversion:',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
        ),
        const SizedBox(height: 10.0),
        ConversionRadioOptions(
          conversionOption: conversionOption,
          currentOption: currentOption,
          onOptionChanged: onOptionChanged, 
        ),
      ],
    );
  }
}
