import 'package:flutter/material.dart';
import 'package:niyam/utils/colours.dart';

class ArtiOptionWidget extends StatelessWidget {
  const ArtiOptionWidget({
    super.key, required this.text, required this.onTap,

  });
  final dynamic text;
  final VoidCallback onTap ;

  @override
  Widget build(BuildContext context) {


    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.92,
      height: 55,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          backgroundColor: baseColor.withOpacity(0.3),
          elevation: 15,
          shadowColor: Colors.red.shade600,
        ),
        child:  Text(
          text,
          style: TextStyle(
              fontFamily: 'hind_medium',
              fontSize: 21,
              color: baseColor.shade600),
        ),
      ),);
  }
}