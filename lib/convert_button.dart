import 'package:flutter/material.dart';
import 'package:temperature_converter_app/models/conversation.dart';
import 'package:temperature_converter_app/models/conversion_book.dart';

class ConvertButton extends StatefulWidget {
  const ConvertButton({
    super.key,
    required this.currentOption,
  });

  final String currentOption;

  @override
  State<ConvertButton> createState() => _ConvertButtonState();
}

class _ConvertButtonState extends State<ConvertButton> {
  late final TextEditingController _controller;
  late final TextEditingController _outputController;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _outputController = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _outputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 150,
                  height: 50,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _controller,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 214, 212, 212),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ),
                const Text(
                  '=',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
                ),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: TextField(
                    textAlign: TextAlign.center,
                    readOnly: true,
                    controller: _outputController,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 214, 212, 212),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 0, 74, 194)),
                      ),
                    ),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 40.0),
        Center(
          child: OutlinedButton(
            onPressed: () {
              double? parsedValue;
              double? convertedValue;

              try {
                parsedValue = double.parse(_controller.text);

                if (widget.currentOption == 'F to C') {
                  convertedValue = fahrenheitToCelsius(parsedValue);
                } else {
                  convertedValue = celsiusToFahrenheit(parsedValue);
                }

                _outputController.text = convertedValue.toString();

                final conversion = Conversion(
                  type: widget.currentOption,
                  value: parsedValue,
                  convertedValue: convertedValue,
                  currentOption: widget.currentOption,
                );

                ConversionBook().add(conversion: conversion);
              } catch (e) {
                print('$e');
              }
            },
            style: ButtonStyle(
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
              minimumSize: WidgetStateProperty.all<Size>(
                const Size(150, 45),
              ),
            ),
            child: const Text(
              'CONVERT',
              style: TextStyle(
                color: Color.fromARGB(255, 0, 76, 255),
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  double fahrenheitToCelsius(double fahrenheit) {
    double celsius = (fahrenheit - 32) * 5 / 9;
    return double.parse(celsius.toStringAsFixed(1));
  }

  double celsiusToFahrenheit(double celsius) {
    double fahrenheit = (celsius * 9 / 5) + 32;
    return double.parse(fahrenheit.toStringAsFixed(1));
  }
}
