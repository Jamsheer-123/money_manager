import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:money_manager/bloc/catagory/catagory_bloc.dart';
import 'package:money_manager/bloc/transaction/transaction_bloc.dart';

class TabBarViewComponet extends StatelessWidget {
  const TabBarViewComponet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CatagoryBloc>(context).add(GetSpecifedCatagory());

    return BlocBuilder<CatagoryBloc, CatagoryState>(
      builder: (context, catagoryblocState) {
        return SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 300,
              child: TabBarView(
                children: [
                  GridView.builder(
                      shrinkWrap: true,
                      itemCount: catagoryblocState
                              .spefieldCatagoryListexpense?.length ??
                          0,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 3 / 3.4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 4,
                      ),
                      itemBuilder: (context, index) {
                        log(catagoryblocState
                            .spefieldCatagoryListexpense![index].images);
                        return SizedBox(
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  BlocProvider.of<TransactionBloc>(context).add(
                                      SelectCatgory(
                                          catagoryModel: catagoryblocState
                                                  .spefieldCatagoryListexpense![
                                              index]));
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle),
                                  child: SvgPicture.asset(
                                      catagoryblocState
                                          .spefieldCatagoryListexpense![index]
                                          .images,
                                      height: 60,
                                      width: 60,
                                      // "assets/catagorysvg/amazon-prime-video.svg",
                                      fit: BoxFit.cover),
                                ),
                              ),
                              Text(
                                catagoryblocState
                                        .spefieldCatagoryListexpense?[index]
                                        .name ??
                                    "",
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        );
                      }),
                  GridView.builder(
                    shrinkWrap: true,
                    itemCount:
                        catagoryblocState.specfiedcatgroyListicome?.length ?? 0,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 4,
                    ),
                    itemBuilder: (context, index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BlocBuilder<TransactionBloc, TransactionState>(
                          builder: (context, state) {
                            return GestureDetector(
                              onTap: () {
                                BlocProvider.of<TransactionBloc>(context).add(
                                    SelectCatgory(
                                        catagoryModel: catagoryblocState
                                            .specfiedcatgroyListicome![index]));
                              },
                              child: Container(
                                decoration:
                                    const BoxDecoration(shape: BoxShape.circle),
                                child: SvgPicture.asset(
                                    catagoryblocState
                                        .specfiedcatgroyListicome![index]
                                        .images,
                                    height: 50,
                                    width: 50,
                                    // "assets/catagorysvg/amazon-prime-video.svg",
                                    fit: BoxFit.fill),
                              ),
                            );
                          },
                        ),
                        Center(
                          child: Text(
                            catagoryblocState
                                    .specfiedcatgroyListicome?[index].name ??
                                "",
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
