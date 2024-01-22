import 'package:floder_owner/constants/gaps.dart';
import 'package:floder_owner/features/manage/views/manage_screen.dart';
import 'package:floder_owner/features/me/views/me_screen.dart';
import 'package:floder_owner/features/order/views/order_screen.dart';
import 'package:floder_owner/features/waiting/views/waiting_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  final List<String> _tabs = ["order", "waiting", "manage", "me"];
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
            child: const ManageScreen(),
          ),
          Offstage(
            offstage: _tabIndex != 3,
            child: const MeScreen(),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.zero,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => _onTap(0),
                child: Container(
                  decoration: const BoxDecoration(),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: _tabIndex == 0 ? 1 : 0.5,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.pizzaSlice,
                        ),
                        Gaps.v10,
                        Text("주문"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => _onTap(1),
                child: Container(
                  decoration: const BoxDecoration(),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: _tabIndex == 1 ? 1 : 0.5,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.personBooth,
                        ),
                        Gaps.v10,
                        Text("웨이팅"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => _onTap(2),
                child: Container(
                  decoration: const BoxDecoration(),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: _tabIndex == 2 ? 1 : 0.5,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.listCheck,
                        ),
                        Gaps.v10,
                        Text("매장 관리"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => _onTap(3),
                child: Container(
                  decoration: const BoxDecoration(),
                  child: AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: _tabIndex == 3 ? 1 : 0.5,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.f,
                        ),
                        Gaps.v10,
                        Text("my 플로더"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
