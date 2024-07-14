import 'package:flutter/material.dart';
import 'package:temperature_converter_app/models/conversion_book.dart';

class HistoryContainer extends StatelessWidget {
  const HistoryContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: Color.fromARGB(39, 0, 89, 255),
        border: Border.all(
          color: Colors.blue,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ValueListenableBuilder(
        valueListenable: ConversionBook(),
        builder: (context, conversions, child) {
          return ListView.builder(
            itemCount: conversions.length,
            itemBuilder: (BuildContext context, int index) {
              final reverseIndex = conversions.length - 1 - index;
              final conversion = conversions[reverseIndex];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.0),
                child: ListTile(
                  title: Text(
                    conversion.text,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
