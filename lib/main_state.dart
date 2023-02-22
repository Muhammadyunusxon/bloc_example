class MainState {
  final int counter;
  final String name;

  MainState({this.counter = 0, this.name = ""});

  copyWith({int? counter, String? name}) {
    return MainState(name: name ?? this.name, counter: counter ?? this.counter);
  }
}
