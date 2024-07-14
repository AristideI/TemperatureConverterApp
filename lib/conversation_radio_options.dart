import 'package:flutter/material.dart';

class ConversionRadioOptions extends StatefulWidget {
  const ConversionRadioOptions({
    super.key,
    required this.currentOption,
    required this.conversionOption,
    required this.onOptionChanged,
  });

  final String currentOption;
  final List<String> conversionOption;
  final ValueChanged<String> onOptionChanged;

  @override
  State<ConversionRadioOptions> createState() => _ConversionRadioOptionsState();
}

class _ConversionRadioOptionsState extends State<ConversionRadioOptions> {
  late String currentOption;
  late List<String> conversionOptions;
  late ValueChanged<String> onOptionChanged;

  @override
  void initState() {
    super.initState();
    currentOption = widget.currentOption;
    conversionOptions = widget.conversionOption;
    onOptionChanged = widget.onOptionChanged;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: ListTile(
            title: const Text(
              'Fahrenheit to Celsius',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
              ),
            ),
            leading: Radio(
              value: widget.conversionOption[0], // Fixed reference here
              groupValue: currentOption,
              onChanged: (value) {
                setState(
                  () {
                    currentOption = value.toString();
                  },
                );
                onOptionChanged(value.toString());
              },
            ),
          ),
        ),
        Expanded(
          child: ListTile(
            title: const Text(
              'Celsius to Fahrenheit',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.0,
              ),
            ),
            leading: Radio(
              value: widget.conversionOption[1], // Fixed reference here
              groupValue: currentOption,
              onChanged: (value) {
                setState(
                  () {
                    currentOption = value.toString();
                  },
                );
                onOptionChanged(value.toString());
              },
            ),
          ),
        ),
      ],
    );
  }
}
