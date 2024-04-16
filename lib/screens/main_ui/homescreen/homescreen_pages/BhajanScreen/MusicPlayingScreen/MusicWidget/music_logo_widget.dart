import 'package:flutter/material.dart';
import '../../../../../../../utils/colours.dart';

class MusicLogoWidget extends StatelessWidget {
  const MusicLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white.withOpacity(0.3)),
        child: const Icon(
          Icons.music_note_rounded,
          size: 100,
          color: gradient1,
        ));
  }
}
