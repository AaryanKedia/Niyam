import 'package:flutter/material.dart';

import 'arti_option_widget.dart';

class ArtiNamesWidget extends StatelessWidget {
  const ArtiNamesWidget({
    super.key,
    required this.text,
    required this.screens,
  });

  final List<String> text;
  final List<Widget> screens;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: text.length, // Adjust the itemCount as needed
        itemBuilder: (context, index) {
          return Column(
            children: [
              ArtiOptionWidget(
                text: text[index],
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => screens[index]));
                },
              ),
              const SizedBox(
                height: 20,
              )
            ],
          );
        },
      ),
    );
  }
}
