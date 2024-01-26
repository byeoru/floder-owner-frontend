import 'package:floder_owner/constants/gaps.dart';
import 'package:floder_owner/constants/sizes.dart';
import 'package:floder_owner/features/store/viewmodels/menu_viewmodel.dart';
import 'package:floder_owner/features/store/views/menu_add_screen.dart';
import 'package:floder_owner/features/store/views/widgets/menu_tile_widget.dart';
import 'package:floder_owner/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class StoreScreen extends ConsumerWidget {
  const StoreScreen({super.key});

  void _onAddMenuBtnTap(BuildContext context) {
    context.pushNamed(
      MenuAddScreen.routeName,
      pathParameters: {"tab": "store"},
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = Utils.isDarkMode(context);
    final Color headerTileColor = isDarkMode
        ? Theme.of(context).primaryColor.withOpacity(0.2)
        : Colors.white38;
    final listTileColor = isDarkMode ? null : Colors.white38;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          const SliverAppBar(
            title: Text("매장 관리"),
            pinned: true,
          )
        ],
        body: ListView(
          padding: const EdgeInsets.only(bottom: 120),
          children: [
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                collapsedBackgroundColor: headerTileColor,
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
            Gaps.v14,
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                initiallyExpanded: true,
                collapsedBackgroundColor: listTileColor,
                title: Text(
                  "메뉴 관리",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                children: [
                  ref.watch(menuViewModel).when(
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        error: (error, stackTrace) => const Center(
                          child: Text("서버 에러: 메뉴를 불러오는데 실패하였습니다"),
                        ),
                        data: (menu) => GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                            horizontal: Utils.appHorizontalPaddingSize,
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: Sizes.size5,
                            crossAxisSpacing: Sizes.size5,
                          ),
                          itemCount: menu.length + 1,
                          itemBuilder: (context, index) => index == 0
                              ? GestureDetector(
                                  onTap: () => _onAddMenuBtnTap(context),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Theme.of(context).primaryColor,
                                        width: 0.5,
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(Sizes.size20),
                                      ),
                                    ),
                                    child: Center(
                                      child: FaIcon(
                                        FontAwesomeIcons.plus,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                )
                              : MenuItemWidget(
                                  pk: menu[index].pk,
                                  name: menu[index].name,
                                  normalPrice: menu[index].normalPrice,
                                  disPrice: menu[index].disPrice,
                                  count: menu[index].count,
                                ),
                        ),
                      ),
                ],
              ),
            ),
            Gaps.v14,
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
              ),
              child: ExpansionTile(
                initiallyExpanded: true,
                collapsedBackgroundColor: listTileColor,
                title: Text(
                  "QR 코드 관리",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                children: const [
                  Center(
                    child: Text("준비중인 서비스입니다"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
