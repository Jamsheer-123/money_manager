// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_manager/bloc/catagory/catagory_bloc.dart';
import 'package:money_manager/bloc/transaction/transaction_bloc.dart';
import 'package:money_manager/model/transaction.model/transaction.model.dart';
import 'package:money_manager/pages/create.transaction/component/amount&date.componet.dart';
import 'package:money_manager/pages/create.transaction/component/tababarview.componet.dart';
import 'package:money_manager/utils/appfont.dart';

// ignore: must_be_immutable
class TranScationScreeen extends StatelessWidget {
  TranScationScreeen({Key? key}) : super(key: key);

  TextEditingController amountController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CatagoryBloc>(context).add(GetSpecifedCatagory());

    return SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 2,
          child: Form(
            key: formkey,
            child: CustomScrollView(
              slivers: [
                const SliverAppBar(
                  title: Text("Create Payment"),
                ),
                AmountAndDateRealtedComponent(
                    amountController: amountController),
                const SliverToBoxAdapter(
                  child: SizedBox(
                    height: 48, // Adjust the height as needed
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: Colors.greenAccent,
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        Tab(
                          child: Text("EXPENSE"),
                        ),
                        Tab(
                          child: Text("INCOME"),
                        ),
                      ],
                    ),
                  ),
                ),
                const TabBarViewComponet(),
                SliverToBoxAdapter(
                  child: BlocBuilder<TransactionBloc, TransactionState>(
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () {
                          if (formkey.currentState!.validate()) {
                            if (state.selectedDate != null) {
                              if (state.selectedCatgroyModel != null) {
                                final TransactionModel tra = TransactionModel(
                                    amount: double.parse(amountController.text),
                                    date: state.selectedDate!,
                                    catagoryType: state
                                        .selectedCatgroyModel!.catagoryType,
                                    pupose: "qwertykfhert",
                                    catagoryModel: state.selectedCatgroyModel!);
                                BlocProvider.of<TransactionBloc>(context)
                                    .add(AddTranScation(transcationModel: tra));

                                Navigator.pop(context);
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text(
                                    'Please Select Your Catagory type',
                                  ),
                                  duration: Duration(seconds: 1),
                                  // action: SnackBarAction(
                                  //   label: 'Please Select Your Date',
                                  //   onPressed: () {},
                                  // ),
                                ));
                              }
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                  'Please Select Your Date',
                                ),
                                duration: Duration(seconds: 1),
                                // action: SnackBarAction(
                                //   label: 'Please Select Your Date',
                                //   onPressed: () {},
                                // ),
                              ));
                            }
                          }
                          // var a = num.parse(amountController.text.toString());
                          // log(a.toString());
                        },
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: const BoxDecoration(
                              color: Colors.green,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: Text(
                            "Make Transaction",
                            style: AppTextStyle.nunito16w600,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
