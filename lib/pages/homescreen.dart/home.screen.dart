import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_manager/bloc/transaction/transaction_bloc.dart';
import 'package:money_manager/pages/homescreen.dart/component/balance.dart';
import 'package:money_manager/pages/homescreen.dart/component/income.dart';
import 'package:money_manager/utils/space.dart';

import 'component/expense.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    // BlocProvider.of<TransactionBloc>(context).add(GetGraph());
    BlocProvider.of<TransactionBloc>(context).add(GetTranscation());

    // Listen for tab changes
  }

  @override
  void dispose() {
    super.dispose();
    if (_tabController != null) {
      _tabController!.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(10),
                  const SizedBox(
                    height: 20,
                  ),
                  TabBar(
                    controller: _tabController,
                    splashBorderRadius: BorderRadius.zero,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: Colors.black,
                    dividerColor: Colors.transparent,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    tabs: const [
                      Tab(
                        child: Text("BALANCE"),
                      ),
                      Tab(
                        child: Text("INCOME"),
                      ),
                      Tab(
                        child: Text("EXPENSE"),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: const [
                  // Text("kujhygtfre"),
                  // LineChartSample3(),
                  BalanceComponent(),
                  // Text("scsc"),
                  IncomeChart(),
                  // Text("kdfwekfwekmfkmlqefklmqekml"),
                  Expense(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
