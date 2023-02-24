import 'dart:io';

import 'package:bloc_example/homework-24/add_ads_cubit.dart';
import 'package:bloc_example/homework-24/info_page.dart';
import 'package:bloc_example/homework-24/my_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAdsScreen extends StatefulWidget {
  const AddAdsScreen({Key? key}) : super(key: key);

  @override
  State<AddAdsScreen> createState() => _AddAdsScreenState();
}

class _AddAdsScreenState extends State<AddAdsScreen> {

  TextEditingController productName= TextEditingController();
  TextEditingController productDesc= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("E'lon berish")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text("E'lon haqida"),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => BlocProvider.value(
                  value: BlocProvider.of<AddAdsCubit>(context),
                  child: const Dialog(child: MyDialog()),
                ),
              );
            },
            child: BlocSelector<AddAdsCubit, AddAdsState, AddAds>(
              selector: (state) {
                return state as AddAds;
              },
              builder: (context, state) {
                return state.imagePath.isEmpty
                    ? Container(
                        height: 93,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          gradient: const LinearGradient(
                              colors: [Color(0x5070A8FF), Color(0xff70A8FF)]),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.linked_camera_rounded,
                              color: Color(0xff033C67),
                            ),
                            Text("Rasm yuklash"),
                          ],
                        ),
                      )
                    : Image.file(File(state.imagePath));
              },
            ),
          ),
          const SizedBox(height: 8),
          TextFormField(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    value: BlocProvider.of<AddAdsCubit>(context),
                    child: const InfoPage(),
                  ),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                      colors: [Color(0xff033C67), Color(0xff0D6AA7)])),
              child: const Center(
                child: Text(
                  "Davom etish",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
