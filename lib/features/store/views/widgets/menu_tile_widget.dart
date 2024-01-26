import 'package:floder_owner/constants/sizes.dart';
import 'package:floder_owner/features/store/views/menu_detail_screen.dart';
import 'package:floder_owner/utils.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MenuItemWidget extends StatelessWidget {
  final int pk;
  final String name;
  final int normalPrice;
  final int? disPrice;
  final int? count;

  const MenuItemWidget({
    super.key,
    required this.pk,
    required this.name,
    required this.normalPrice,
    required this.disPrice,
    required this.count,
  });

  void _onTap(BuildContext context) {
    context.pushNamed(
      MenuDetailScreen.routeName,
      pathParameters: {"pk": pk.toString()},
      extra: name,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _onTap(context),
      child: GridTile(
        header: ListTile(
          titleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Colors.white,
            shadows: [
              const Shadow(
                color: Colors.black,
                offset: Offset(1.05, 1.05),
                blurRadius: 0.1,
              ),
            ],
          ),
          title: Text(count == null ? "준비중" : "남은 개수: $count"),
        ),
        footer: ListTile(
          titleTextStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Colors.white,
            shadows: [
              const Shadow(
                color: Colors.black,
                offset: Offset(1.05, 1.05),
                blurRadius: 0.1,
              ),
            ],
          ),
          subtitleTextStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: Colors.white,
            shadows: [
              const Shadow(
                color: Colors.black,
                offset: Offset(1.05, 1.05),
                blurRadius: 0.1,
              ),
            ],
          ),
          isThreeLine: true,
          title: Text(name),
          subtitle: Text("정가: $normalPrice\n할인가: ${disPrice ?? "할인 없음"}"),
        ),
        child: Opacity(
          opacity: count == null ? 0.3 : 1,
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
      ),
    );
  }
}
