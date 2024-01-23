import 'package:floder_owner/constants/sizes.dart';
import 'package:floder_owner/features/store/views/menu_detail_screen.dart';
import 'package:floder_owner/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuTileWidget extends StatelessWidget {
  final int pk;
  final String name;
  final int normalPrice;
  final int? disPrice;

  const MenuTileWidget({
    super.key,
    required this.pk,
    required this.name,
    required this.normalPrice,
    required this.disPrice,
  });

  void _onTap(BuildContext context) {
    context.pushNamed(
      MenuDetailScreen.routeName,
      pathParameters: {"pk": pk.toString()},
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context),
      child: GridTile(
        footer: ListTile(
          isThreeLine: true,
          title: Text(
            name,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              shadows: [
                Shadow(
                  color:
                      Utils.isDarkMode(context) ? Colors.black : Colors.white,
                  offset: const Offset(1.1, 1.1),
                  blurRadius: 0.1,
                ),
              ],
            ),
          ),
          subtitle: Text(
            "정가: $normalPrice\n할인가: ${disPrice ?? "할인 없음"}",
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
              shadows: [
                Shadow(
                  color:
                      Utils.isDarkMode(context) ? Colors.black : Colors.white,
                  offset: const Offset(1.1, 1.1),
                  blurRadius: 0.1,
                ),
              ],
            ),
          ),
        ),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Utils.isDarkMode(context)
                ? Theme.of(context).primaryColor.withOpacity(0.2)
                : Colors.white38,
            borderRadius: const BorderRadius.all(
              Radius.circular(Sizes.size20),
            ),
          ),
          child: Image.asset(
            "assets/images/test.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
