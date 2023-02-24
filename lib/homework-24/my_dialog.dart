import 'package:bloc_example/homework-24/add_ads_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
const  kGreenColor =Color(0xff033C67);


class MyDialog extends StatelessWidget {
  const MyDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final event = context.read<AddAdsCubit>();
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: kGreenColor, borderRadius: BorderRadius.circular(14)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){
                  event.getImageCamera();
                  Navigator.pop(context);
                },
                child: Container(
                    height: 65,
                    width: 65,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.5)),
                    child: const Icon(
                      Icons.camera_alt,
                      size: 28,
                      color: kGreenColor,
                    )),
              ),
              GestureDetector(
                onTap: (){
                  event.getImageGallery();
                  Navigator.pop(context);
                },
                child: Container(
                    height: 65,
                    width: 65,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.5)),
                    child: const Icon(
                      Icons.folder_copy,
                      size: 28,
                      color: kGreenColor,
                    )),
              ),
              GestureDetector(
                onTap: (){
                  event.clearImage();
                  Navigator.pop(context);
                },
                child: Container(
                    height: 65,
                    width: 65,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.5)),
                    child: const Icon(
                      Icons.delete,
                      size: 28,
                      color: kGreenColor,
                    )),
              ),
            ],
          ),
          const SizedBox(height: 32),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white.withOpacity(0.5),
              ),
              child: const Text(
                "Cencel",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
