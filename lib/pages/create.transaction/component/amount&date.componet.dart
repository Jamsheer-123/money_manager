import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_manager/bloc/transaction/transaction_bloc.dart';
import 'package:money_manager/pages/create.transaction/component/datepickerwidegt.dart';
import 'package:money_manager/utils/validators.utils.dart';

import '../../../utils/appfont.dart';
import '../../../utils/space.dart';

class AmountAndDateRealtedComponent extends StatelessWidget {
  AmountAndDateRealtedComponent({
    super.key,
    required this.amountController,
  });

  TextEditingController amountController;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 10),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          Text(
            "Amount",
            style: AppTextStyle.nunito16w600.copyWith(color: Colors.black),
          ),

          TextFormField(
            showCursor: true,
            cursorHeight: 60,
            cursorWidth: 10,
            controller: amountController,
            style: AppTextStyle.popin20W500.copyWith(color: Colors.grey),
            validator: Validators.noneEmptyValidator,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              hintText: "Amount",
              border: InputBorder.none,
            ),
          ),
          // CustomTextField(
          //   validator: Validators.mobileNumberValidator,
          //   counterText: "Amount",
          //   hintText: ' Enter Your Phone amount',
          //   keybord: TextInputType.number,
          //   controls: amountController,
          //   color: const Color(0xFFF4F5F7),
          // ),
          verticalSpace(10),
          Text(
            "Date",
            style: AppTextStyle.nunito16w600,
          ),

          BlocBuilder<TransactionBloc, TransactionState>(
            builder: (context, state) {
              return InkWell(
                  onTap: () => BlocProvider.of<TransactionBloc>(context)
                      .add(PickDateEvent(context: context)),
                  child: DatepickerWidegt(selctedDate: state.selectedDate));
            },
          )
          // DateTimePicker(
          //   autofocus: false,
          //   firstDate: DateTime(2000),
          //   lastDate: DateTime.now(),
          //   decoration: InputDecoration(
          //     enabledBorder: OutlineInputBorder(
          //       gapPadding: 5,
          //       borderSide:
          //           const BorderSide(width: 0.50, color: Color(0xFFE3E7EB)),
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //     focusedBorder: OutlineInputBorder(
          //       gapPadding: 7,
          //       borderSide:
          //           const BorderSide(width: 0.50, color: Color(0xFFE3E7EB)),
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //     hintText: "Select Date",
          //     icon: const Icon(Icons.event_note, size: 40),
          //     labelStyle: AppTextStyle.nunito16w600,
          //   ),
          //   onChanged: (val) {},
          //   validator: (val) {
          //     return null;
          //   },
          //   onSaved: (val) {},
          // ),
        ]),
      ),
    );
  }
}
