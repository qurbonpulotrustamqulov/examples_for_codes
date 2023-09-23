import 'package:bloc/bloc.dart';
import 'package:examples/CUBIT_SQFLITE/lib/main.dart';
import 'package:examples/CUBIT_SQFLITE/lib/model/todo_model.dart';
import 'package:meta/meta.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitial());

  void fetchTodos() async {
    emit(HomeLoading(todos: state.todos));
    try {
      final todos = await sql.todos();
      emit(HomeFetchSuccess(todos: todos));
    } catch(e) {
      emit(HomeFailure(todos: state.todos, message: "HOME ERROR: $e"));
    }
  }
}