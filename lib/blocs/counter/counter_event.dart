part of 'counter_bloc.dart';

sealed class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class CounterIncreasedEvent extends CounterEvent {}

class CounterDecreasedEvent extends CounterEvent {}
