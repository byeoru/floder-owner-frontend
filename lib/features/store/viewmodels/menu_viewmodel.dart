import 'dart:async';

import 'package:floder_owner/features/store/models/menu_list_model.dart';
import 'package:floder_owner/features/store/repositories/menu_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuViewModel extends AsyncNotifier<List<MenuListModel>> {
  late final MenuRepository _menuRepository;

  @override
  FutureOr<List<MenuListModel>> build() async {
    // _menuRepository = ref.read(menuRepository);
    // return await _menuRepository.getMenus();
    await Future.delayed(const Duration(seconds: 1));
    return List.empty();
  }

  Future<void> getMenus() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _menuRepository.getMenus());
  }
}

final menuViewModel = AsyncNotifierProvider<MenuViewModel, List<MenuListModel>>(
  () => MenuViewModel(),
);
