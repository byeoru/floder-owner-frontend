import 'package:floder_owner/constants/gaps.dart';
import 'package:floder_owner/constants/sizes.dart';
import 'package:floder_owner/features/store/viewmodels/menu_viewmodel.dart';
import 'package:floder_owner/features/store/views/widgets/menu_tile_widget.dart';
import 'package:floder_owner/features/store/views/widgets/tile_name_widget.dart';
import 'package:floder_owner/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StoreScreen extends ConsumerWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("매장 관리"),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              // 매장 운영 시간 설정
              child: ExpansionTile(
                collapsedBackgroundColor: Utils.isDarkMode(context)
                    ? Theme.of(context).primaryColor.withOpacity(0.2)
                    : Colors.white38,
                title: Text(
                  "매장 운영 시간 설정",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                subtitle: const Text("현재 운영 시간: 9:30 ~ 21:00"),
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "오픈",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            CupertinoTimerPicker(
                              mode: CupertinoTimerPickerMode.hm,
                              onTimerDurationChanged: (value) {},
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "마감",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            CupertinoTimerPicker(
                              mode: CupertinoTimerPickerMode.hm,
                              onTimerDurationChanged: (value) {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Gaps.v10,
                  CupertinoButton(
                    child: Text(
                      "완료",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).primaryColor,
                          ),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ];
        },
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TileNameWidget(
              name: "메뉴 관리",
            ),
            Expanded(
              child: ref.watch(menuViewModel).when(
                    error: (error, stackTrace) => const Center(
                      child: Text("메뉴를 로딩 실패: 다시 시도해 주세요"),
                    ),
                    loading: () => const CircularProgressIndicator(),
                    data: (menu) => GridView.builder(
                      padding:
                          const EdgeInsets.symmetric(horizontal: Sizes.size5),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: Sizes.size5,
                        crossAxisSpacing: Sizes.size5,
                      ),
                      itemCount: menu.length,
                      itemBuilder: (context, index) {
                        return MenuTileWidget(
                          pk: menu[index].pk,
                          name: menu[index].name,
                          normalPrice: menu[index].normalPrice,
                          disPrice: menu[index].disPrice,
                        );
                      },
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
