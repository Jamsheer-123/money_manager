import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_manager/bloc/transaction/transaction_bloc.dart';
import 'package:money_manager/utils/appfont.dart';

Future<bool> conformDelete(BuildContext context, String id) async {
  bool isDeleted = false;

  Widget buildCupertinoDialog(BuildContext context, String id) {
    return CupertinoAlertDialog(
      title: const Text('Logout Confirmation'),
      content: const Text('Are you sure you want to log out?'),
      actions: <Widget>[
        CupertinoDialogAction(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        CupertinoDialogAction(
          child: const Text('Logout'),
          onPressed: () {
            isDeleted = true;

            // Perform the logout action here
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  Widget buildMaterialDialog(BuildContext context, String id) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0), // Adjust the radius as needed
      ),
      backgroundColor: Colors.white,
      content: Text(
        'Are you sure you want to Delete?',
        style: AppTextStyle.nunito18w700,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel',
              style: AppTextStyle.nunito16w600.copyWith(color: Colors.black)),
        ),
        TextButton(
            onPressed: () async {
              isDeleted = true;
              BlocProvider.of<TransactionBloc>(context)
                  .add(DeleteTransaction(transactionid: id));

              Navigator.of(context).pop();

              // await signOutFromGoogle();
            },
            child: Text("Delete",
                style: AppTextStyle.nunito16w600.copyWith(color: Colors.red)))
      ],
    );
  }

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return Theme.of(context).platform == TargetPlatform.iOS
          ? buildCupertinoDialog(context, id)
          : buildMaterialDialog(context, id);
    },
  );

  return isDeleted;
}
