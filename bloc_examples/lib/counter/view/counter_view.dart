import 'package:bloc_examples/counter/bloc/counter_bloc.dart';
import 'package:bloc_examples/counter/mixins/show_message_mixin.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatelessWidget {
  const CounterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Counter App'),
        ),
        body: const CounterBody(),
      ),
    );
  }
}

class CounterBody extends StatelessWidget with ShowMessage {
  const CounterBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<CounterBloc, CounterState>(
      listener: _listener,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BlocSelector<CounterBloc, CounterState, int>(
            selector: (state) {
              return state.value;
            },
            builder: (context, value) {
              return Text('Counter : $value');
            },
          ),
          _floatingButtons(context),
        ],
      ),
    );
  }

  void _listener(context, state) {
    if (state.isIncremented) {
      showMessage('Incremented!', context);
    } else if (state.isDecremented) {
      showMessage('Decremented!', context);
    }
  }

  Row _floatingButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FloatingActionButton(
          onPressed: () {
            context.read<CounterBloc>().add(IncrementCounterEvent());
          },
          child: const Icon(Icons.add),
        ),
        const SizedBox(
          width: 50,
        ),
        FloatingActionButton(
          onPressed: () {
            context.read<CounterBloc>().add(DecrementCounterEvent());
          },
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
