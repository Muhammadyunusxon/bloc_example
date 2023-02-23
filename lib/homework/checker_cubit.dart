import 'package:bloc/bloc.dart';

part 'checker_state.dart';

class CheckerCubit extends Cubit<CheckerState> {
  CheckerCubit() : super(CheckerState());

   check(String? title) {
    emit(state.copyWith(isCheck: title == state.title));
    return state.isCheck;
  }
}
