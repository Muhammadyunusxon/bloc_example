part of 'checker_cubit.dart';

class CheckerState {
  final bool isCheck;
  final String title;

  CheckerState({this.isCheck=false, this.title = "test"});

  copyWith({bool? isCheck, String? title}) {
    return CheckerState(
        isCheck: isCheck ?? this.isCheck, title: title ?? this.title);
  }
}
