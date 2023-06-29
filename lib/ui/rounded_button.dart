import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Function()? onPressed;
  final String text;
  final Color color;
  final double padding;

  const RoundedButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.color,
      required this.padding});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(bottom: padding),
        child: ElevatedButton(
          onPressed: onPressed!,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
            overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
                side: BorderSide(color: color),
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(padding == 0 ? 0 : 12),
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 18.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
