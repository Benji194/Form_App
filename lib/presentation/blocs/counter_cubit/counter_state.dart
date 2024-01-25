part of 'counter_cubit.dart';

class  CounterState  extends Equatable{
  final int counter ;
  final int transationCount;

  const CounterState({
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
  
  @override
  List<Object> get props => [ counter, transationCount ];

}