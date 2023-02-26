import 'package:flutter/material.dart';

class MyDropDown extends StatelessWidget {
  final String? value;
  final String hint;
  final List list;
  final ValueChanged onChanged;

  const MyDropDown(
      {Key? key,
      this.value,
      required this.list,
      required this.onChanged,
      required this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      hint: Text(hint),
      value: value,
      items: list.map((e) {
        return DropdownMenuItem(value: e, child: Text(e));
      }).toList(),
      onChanged: onChanged,
      dropdownColor: Colors.indigoAccent,
      iconEnabledColor: Colors.white,
      borderRadius: BorderRadius.circular(14),
      decoration: const InputDecoration(),
    );
  }
}
