import 'package:bloc_course_dev/counter_event.dart';
import 'package:bloc_course_dev/counter_state.dart';
import 'package:bloc_course_dev/couter_cubit.dart';
import 'package:bloc_course_dev/features/fetch_data/cubit/freezed_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.counterValue == 5) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Counter is equal to 5'),
              ),
            );
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                return Text(
                  '${state.counterValue}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              }),
              BlocBuilder<FreezedDataCubit, FreezedDataState>(
                  builder: (context, state) {
                return state.when(
                    initial: () => const CircularProgressIndicator(),
                    loading: () => const CircularProgressIndicator(),
                    loaded: (loaded) => Column(
                          children: [
                            Text(loaded.title ?? ''),
                            Text('${loaded.id}')
                          ],
                        ),
                    error: () => const Text('Error'));
              }),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            onPressed: () =>
                context.read<CounterCubit>().add(CounterDecrement()),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().add(CounterIncrement());
              context.read<FreezedDataCubit>().fetchData('2');
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
