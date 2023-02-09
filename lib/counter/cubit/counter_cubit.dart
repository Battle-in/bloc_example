import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_state.dart';
part 'counter_cubit.freezed.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(const CounterState.initial());

  void initial(){
    emit(const CounterState.loading());
    Future.delayed(const Duration(seconds: 5), () => emit(const CounterState.showCount(count: 0)));
  }

  void increment(){
    state.maybeWhen(
      showCount: (value) => emit(CounterState.showCount(count: value + 1)),
        orElse: (){});
  }

  void decrement(){}

  void reset(){}
}
