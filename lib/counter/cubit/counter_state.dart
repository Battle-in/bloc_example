part of 'counter_cubit.dart';

@freezed
class CounterState with _$CounterState {
  const factory CounterState.initial() = _Initial;
  const factory CounterState.loading() = _Loading;
  const factory CounterState.showCount({required int count}) = _ShowCount;
  const factory CounterState.reset() = _Reset;
}
