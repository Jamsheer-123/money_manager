// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({
    super.key,
    required this.postionNotifier,
  });
  final ValueNotifier<int> postionNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: postionNotifier,
        builder: (context, value, child) {
          return Container(
            alignment: Alignment.center,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 136, 216, 31)),
            width: double.infinity,
            height: 72,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NavButton(
                    postionNotifier: postionNotifier,
                    tabIndex: postionNotifier.value,
                    index: 0,
                    icon: postionNotifier.value == 0
                        ? "assets/svg/homebold.svg"
                        : "assets/svg/home.svg",
                    label: "Home",
                  ),
                  NavButton(
                    postionNotifier: postionNotifier,
                    tabIndex: postionNotifier.value,
                    index: 1,
                    icon: postionNotifier.value == 1
                        ? "assets/svg/transactionbold.svg"
                        : "assets/svg/transaction.svg",
                    label: "Projects",
                  ),
                  AddButton(
                      postionNotifier: postionNotifier,
                      tabIndex: postionNotifier.value,
                      icon: "assets/svg/create.svg"),
                  NavButton(
                    postionNotifier: postionNotifier,
                    tabIndex: postionNotifier.value,
                    index: 2,
                    icon: postionNotifier.value == 2
                        ? "assets/svg/calculator-bold.svg"
                        : "assets/svg/Calculator.svg",
                    label: "Message",
                  ),
                  // NavButton(
                  //   postionNotifier: postionNotifier,
                  //   tabIndex: postionNotifier.value,
                  //   index: 3,
                  //   icon: postionNotifier.value == 3
                  //       ? "assets/svg/account.bold.svg"
                  //       : "assets/svg/account.svg",
                  //   label: "Profile",
                  // ),
                ]),
          );
        });
  }
}

class NavButton extends StatelessWidget {
  NavButton(
      {Key? key,
      required this.index,
      required this.icon,
      required this.label,
      required this.tabIndex,
      required this.postionNotifier})
      : super(key: key);
  final int index;
  String icon;
  int tabIndex;
  final ValueNotifier<int> postionNotifier;

  String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          postionNotifier.value = index;
        },
        child: SizedBox(
          // padding: const EdgeInsets.only(bottom: 10),
          height: 50,
          width: double.infinity,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SvgPicture.asset(
              icon,
              width: 24,
              height: 24,
              fit: BoxFit.cover,
            ),
          ]),
        ),
      ),
    );
  }
}

class AddButton extends StatelessWidget {
  AddButton(
      {Key? key,
      required this.icon,
      required this.tabIndex,
      required this.postionNotifier})
      : super(key: key);
  String icon;
  int tabIndex;
  final ValueNotifier<int> postionNotifier;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, "create_transaction");
        },
        child: SizedBox(
          // padding: const EdgeInsets.only(bottom: 10),
          height: 50,
          width: double.infinity,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SvgPicture.asset(
              icon,
              width: 24,
              height: 24,
              fit: BoxFit.cover,
            ),
          ]),
        ),
      ),
    );
  }
}
