import 'package:flutter/material.dart';
import 'package:money_manager/pages/calculator.screen/calculator.screen.dart';
import 'package:money_manager/pages/homelayout/component/bottomnavigationbar.dart';
import 'package:money_manager/pages/homescreen.dart/home.screen.dart';
import 'package:money_manager/pages/transaction/transaction.screeen.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({super.key});
  final ValueNotifier<int> postionNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ValueListenableBuilder(
          valueListenable: postionNotifier,
          builder: (context, value, child) => IndexedStack(
            index: postionNotifier.value,
            children: const [
              // HomeView(),
              HomeScreen(),
              TranSactionScreeen(),
              CalculatorScreen()
              // CartScreen()
            ],
          ),
        ),
        bottomNavigationBar:
            BottomNavigationBarWidget(postionNotifier: postionNotifier),
      ),
    );
  }
}
