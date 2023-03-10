// ignore: depend_on_referenced_packages
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_example/lesson-24/university_model.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

part 'university_state.dart';

class UniversityCubit extends Cubit<UniversityState> {
  UniversityCubit() : super(UniversityState());
  Box<UniverResponse>? box;

  getInfo(String name) async {
    emit(state.copyWith(isLoading: true));
    var res = await http.get(Uri.parse("http://universities.hipolabs.com/search?country=$name"));
    UniverResponse univerResponse= UniverResponse.fromJson(data:  jsonDecode(res.body), name: name);
    box?.put(name,univerResponse);
    getLocal();

    emit(state.copyWith(isLoading: false));
  }

  getLocal() async {
    emit(state.copyWith(isLoading: true));
    box = await Hive.openBox('Univer');
    emit(state.copyWith(isLoading: false, university: box?.values.toList()));
    emit(state.copyWith(isLoading: false));
  }

  deleteUniversity(int index) async {
    box?.deleteAt(index);
    getLocal();
  }


}
