import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_state.dart';

class CounterCubit extends Cubit<MainState> {
  CounterCubit() : super(MainState(counter: 0, name: ""));

  void increment() {
    emit(state.copyWith(counter: state.counter+1));
  }

  void decrement() {
    emit(state.copyWith(counter: state.counter-1));
  }

  void addName(String name) {
    emit(state.copyWith(name: name));
  }
}
