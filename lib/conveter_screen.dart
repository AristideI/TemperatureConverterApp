import 'package:flutter/material.dart';
import 'package:temperature_converter_app/conversation_header.dart';
import 'package:temperature_converter_app/convert_button.dart';
import 'package:temperature_converter_app/history_container.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  List<String> conversionOption = ['F to C', 'C to F'];
  String currentOption = 'F to C';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Converter App')),
          backgroundColor: const Color.fromARGB(255, 0, 77, 211),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ConversionHeader(
                  conversionOption: conversionOption,
                  currentOption: currentOption,
                  onOptionChanged: (newOption) {
                    setState(() {
                      currentOption = newOption;
                    });
                  },
                ),
                const SizedBox(height: 20.0),
                ConvertButton(
                  currentOption: currentOption,
                ),
                const SizedBox(height: 20.0),
                const HistoryContainer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
