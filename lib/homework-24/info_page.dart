import 'dart:io';

import 'package:bloc_example/homework-24/add_ads_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 150,
              width: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: BlocSelector<AddAdsCubit, AddAdsState, AddAds>(
                  selector: (state) {
                    return state as AddAds;
                  },
                  builder: (context, state) {
                    return state.imagePath.isEmpty
                        ? const Placeholder()
                        : Image.file(
                            File(state.imagePath),
                            fit: BoxFit.cover,
                          );
                  },
                ),
              ),
            )),
      ],
    );
  }
}
