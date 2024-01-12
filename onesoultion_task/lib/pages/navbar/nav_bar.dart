import 'package:flutter/material.dart';
import 'package:onesoultion_task/pages/all_bmi/presentation/views/all_bmi_view.dart';
import 'package:onesoultion_task/pages/home/presentation/views/home_view.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({super.key});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeView(),
    const AllBmisView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.monitor_weight_outlined,
            ),
            label: 'All Data',
          ),
        ],
      ),
    );
  }
}
