import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:book_flix/utils/widgets/custom_button.dart';
import 'package:book_flix/utils/widgets/custom_button_icon.dart';
import 'package:book_flix/utils/cutom_navigate.dart';
import 'package:book_flix/main.dart';
import 'package:go_router/go_router.dart';

class Buttons extends StatelessWidget {
  const Buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomButton(
          text: 'Get started',
          icon: const Icon(LucideIcons.arrowUpRight, color: Colors.white),
          onTap: () {
            GoRouter.of(context).push('/favourites');
          }),
      const SizedBox(width: 15.0),
      CustomIconButton(
          icon:
              SvgPicture.asset('assets/img/google.svg', height: 30, width: 30)),
      const SizedBox(width: 10.0),
      CustomIconButton(
          icon: SvgPicture.asset('assets/img/apple.svg', height: 30, width: 30))
    ]);
  }
}
