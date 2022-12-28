import 'package:bloc/bloc.dart';

part 'counter_events.dart';
part 'counter_states.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState>{
  CounterBloc() : super(CounterInitial()){
    on<CounterIncrementEvent>(_counterIncrementHandler);
    on<CounterDecrementEvent>(_counterDecrementHandler);
  }

  Future<void> _counterIncrementHandler(CounterIncrementEvent event, Emitter emitter) async {
    emitter(CounterState(state.counter + 1));
  }

  Future<void> _counterDecrementHandler(CounterDecrementEvent event, Emitter emitter) async {
    emitter(CounterState(state.counter - 1));
  }
}