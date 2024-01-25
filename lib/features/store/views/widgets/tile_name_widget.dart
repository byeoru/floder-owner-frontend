import 'package:floder_owner/constants/gaps.dart';
import 'package:floder_owner/constants/sizes.dart';
import 'package:flutter/material.dart';

class TileNameWidget extends StatelessWidget {
  final String name;
  final Color? color;

  const TileNameWidget({
    super.key,
    required this.name,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: color),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size16,
            ),
            child: Text(
              name,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.start,
            ),
          ),
          Gaps.v8,
        ],
      ),
    );
  }
}
