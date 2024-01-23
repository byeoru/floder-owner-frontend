import 'package:floder_owner/constants/gaps.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavTap extends StatelessWidget {
  final String title;
  final IconData iconData;
  final bool isSelected;
  final Function onTap;
  final duration = const Duration(milliseconds: 200);

  const NavTap({
    super.key,
    required this.title,
    required this.iconData,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          decoration: const BoxDecoration(),
          child: AnimatedOpacity(
            duration: duration,
            opacity: isSelected ? 1 : 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  iconData,
                  color: isSelected ? Theme.of(context).primaryColor : null,
                ),
                Gaps.v10,
                Text(
                  title,
                  style: TextStyle(
                    color: isSelected ? Theme.of(context).primaryColor : null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
