import 'package:bloc_examples/todo_online/features/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void didChangeDependencies() {
    context.read<HomeBloc>().add(InitializeHomeEvent());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Online'),
      ),
      body: Center(
        child: BlocBuilder<HomeBloc, HomeState>(
            builder: ((context, state) => ListView.builder(
                itemCount: state.todos.length,
                itemBuilder: (context, i) => Card(
                      child: ListTile(
                        title: Text('${state.todos[i].todo}'),
                      ),
                    )))),
      ),
    );
  }
}
