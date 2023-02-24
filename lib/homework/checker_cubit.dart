// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

part 'checker_state.dart';

class CheckerCubit extends Cubit<CheckerState> {
  CheckerCubit() : super(CheckerState());

   check(String? title) {
    return title == state.title;
  }
}
