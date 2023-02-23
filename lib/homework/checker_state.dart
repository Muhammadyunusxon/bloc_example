part of 'checker_cubit.dart';

class CheckerState {
  final String title;

  CheckerState({this.title = "test"});

  copyWith({bool? isCheck, String? title}) {
    return CheckerState(title: title ?? this.title);
  }
}
