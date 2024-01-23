import 'package:floder_owner/constants/gaps.dart';
import 'package:floder_owner/constants/sizes.dart';
import 'package:flutter/material.dart';

class TileNameWidget extends StatelessWidget {
  final String name;

  const TileNameWidget({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gaps.v10,
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
        Gaps.v5,
      ],
    );
  }
}
