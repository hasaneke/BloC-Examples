import 'package:bloc/bloc.dart';
import 'package:bloc_examples/todo_online/features/home/data/service/home_service.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  IHomeService homeService;
  HomeBloc(this.homeService) : super(HomeState(todos: [], homeStatus: HomeStatus.none)) {
    on<HomeEvent>((event, emit) async {
      if (event is InitializeHomeEvent) {
        await _initializeHome(emit);
      }
    });
  }
  Future<void> _initializeHome(Emitter emit) async {
    emit(state.copyWith(homeStatus: HomeStatus.loading));
    final todos = await homeService.getTodosById();
    emit(state.copyWith(homeStatus: HomeStatus.loaded, todos: todos));
  }
}
