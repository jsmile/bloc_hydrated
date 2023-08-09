part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counter;

  const CounterState({this.counter = 0});

  factory CounterState.initial() => const CounterState(counter: 0);

  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }

  @override
  List<Object> get props => [counter];

  @override
  String toString() => 'CounterState(counter: $counter)';

  Map<String, dynamic> toMap() {
    return {'counter': counter};
  }

  factory CounterState.fromMap(Map<String, dynamic> jsonMap) {
    return CounterState(
      counter: jsonMap['counter']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) =>
      CounterState.fromMap(json.decode(source));
}
