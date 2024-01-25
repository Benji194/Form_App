part of 'counter_cubit.dart';

class  CounterState {
  final int counter ;
  final int transationCount;

  CounterState({
     this.counter =0,
     this.transationCount =0 ,
  });

  copyWith({
    int? counter,
    int? transationCount,
  }) => CounterState ( 
    counter: counter ?? this.counter ,
    transationCount:  transationCount ?? this.transationCount,
  );

  

}