// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BoldLastWordText extends StatelessWidget {
  final String text;
  final TextStyle? boldStyle;

  const BoldLastWordText({super.key, required this.text, this.boldStyle});

  @override
  Widget build(BuildContext context) {
    // Trim & split the text
    List<String> words = text.trim().split(' ');
    if (words.isEmpty) return const SizedBox();

    // If single word, make it bold
    if (words.length == 1) {
      return Text(
        words[0],
        style: boldStyle ?? const TextStyle(fontWeight: FontWeight.bold),
      );
    }

    String lastWord = words.removeLast();
    String remainingText = words.join(' ');

    return RichText(
      text: TextSpan(
        style: TextStyle(color: Colors.black, fontSize: 30, height: 1.3),
        children: [
          TextSpan(text: '$remainingText '),
          TextSpan(
            text: lastWord,
            style:
                boldStyle ??
                const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
          ),
        ],
      ),
    );
  }
}
