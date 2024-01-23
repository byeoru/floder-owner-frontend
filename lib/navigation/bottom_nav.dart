import 'package:floder_owner/features/store/views/store_screen.dart';
import 'package:floder_owner/features/me/views/me_screen.dart';
import 'package:floder_owner/features/order/views/order_screen.dart';
import 'package:floder_owner/features/sales/views/sales_screen.dart';
import 'package:floder_owner/features/waiting/views/waiting_screen.dart';
import 'package:floder_owner/navigation/widgets/nav_tab.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum ETabs { order, waiting, store, sales, me }

class BottomNavScreen extends StatefulWidget {
  static const String routeName = "bottomNav";
  final String tab;

  const BottomNavScreen({
    super.key,
    required this.tab,
  });

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final List<String> _tabs = [
    ETabs.order.toString(),
    ETabs.waiting.toString(),
    ETabs.store.toString(),
    ETabs.sales.toString(),
    ETabs.me.toString(),
  ];
  late int _tabIndex = _tabs.indexOf(widget.tab);

  void _onTap(int index) {
    setState(() {
      _tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _tabIndex != 0,
            child: const OrderScreen(),
          ),
          Offstage(
            offstage: _tabIndex != 1,
            child: const WaitingScreen(),
          ),
          Offstage(
            offstage: _tabIndex != 2,
            child: const StoreScreen(),
          ),
          Offstage(
            offstage: _tabIndex != 3,
            child: const SalesScreen(),
          ),
          Offstage(
            offstage: _tabIndex != 4,
            child: const MeScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NavTap(
              title: "주문",
              iconData: FontAwesomeIcons.cartShopping,
              isSelected: _tabIndex == 0,
              onTap: () => _onTap(0),
            ),
            NavTap(
              title: "웨이팅",
              iconData: FontAwesomeIcons.personBooth,
              isSelected: _tabIndex == 1,
              onTap: () => _onTap(1),
            ),
            NavTap(
              title: "매장 관리",
              iconData: FontAwesomeIcons.store,
              isSelected: _tabIndex == 2,
              onTap: () => _onTap(2),
            ),
            NavTap(
              title: "매출 현황",
              iconData: FontAwesomeIcons.chartColumn,
              isSelected: _tabIndex == 3,
              onTap: () => _onTap(3),
            ),
            NavTap(
              title: "my 플로더",
              iconData: FontAwesomeIcons.f,
              isSelected: _tabIndex == 4,
              onTap: () => _onTap(4),
            ),
          ],
        ),
      ),
    );
  }
}
