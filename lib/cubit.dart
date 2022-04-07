import 'package:flutter_cubit/model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class TodoCubit extends HydratedCubit<Todo> {
  TodoCubit(Todo inittialState) : super(inittialState);

  void add(Task t) {
    state.tasks.add(t);
    emit(Todo.from(state));
  }

  void remove(Task t) {
    state.tasks.remove(t);
    emit(state);
  }

  @override
  Todo? fromJson(Map<String, dynamic> json) => Todo.fromJson(json);

  @override
  Map<String, dynamic>? toJson(Todo state) => state.toJson();
}
