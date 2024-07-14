import 'package:flutter/material.dart';
import 'conveter_screen.dart';

main() {
  return runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ConverterScreen(),
    );
  }
}
