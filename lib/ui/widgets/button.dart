import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback? callback;
  final Widget? icon;

  const Button({required this.text, this.callback, this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (callback != null) {
          callback!();
        } else {
          print('callback null');
        }
      },
      child: Container(
        height: 55.0,
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(15.0)),
        padding: const EdgeInsets.all(13.0),
        child: Row(children: [
          Text(text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
          icon != null ? const SizedBox(width: 10.0) : const SizedBox.shrink(),
          icon != null ? icon! : const SizedBox.shrink()
        ]),
      ),
    );
  }
}
