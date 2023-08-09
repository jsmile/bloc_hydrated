import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'dart:convert';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> with HydratedMixin {
  CounterBloc() : super(CounterState.initial()) {
    on<CounterIncreasedEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter + 1));
    });

    on<CounterDecreasedEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter - 1));
    });
  }

  // 저장된 상태를 불러옴.
  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    print('*** Counter from storage : $json');
    final counterState = CounterState.fromMap(json);
    print('*** counterState : $counterState');
    return counterState;
  }

  // 상태를 저장함.
  @override
  Map<String, dynamic>? toJson(CounterState state) {
    print('*** CounterState to storage : $state');
    final counterJson = state.toMap();
    print('*** counterJson : $counterJson');
    return counterJson;
  }
}
