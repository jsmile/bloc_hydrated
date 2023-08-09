import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState.initial()) {
    on<CounterIncreasedEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter + 1));
    });

    on<CounterDecreasedEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter - 1));
    });
  }
}
