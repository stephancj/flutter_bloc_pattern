// Import necessary packages and files
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_pattern/blocs/todos/todos_bloc.dart';
import 'package:flutter_bloc_pattern/models/models.dart';

// Import event and state classes
part 'todos_status_event.dart';
part 'todos_status_state.dart';

// Define a BLoC class named TodosStatusBloc that extends Bloc
class TodosStatusBloc extends Bloc<TodosStatusEvent, TodosStatusState> {
  // Reference to the TodosBloc
  final TodosBloc _todosBloc;

  // StreamSubscription for listening to TodosBloc state changes
  late StreamSubscription _todosSubscription;

  // Constructor for TodosStatusBloc, requires a TodosBloc as a parameter
  TodosStatusBloc({required TodosBloc todosBloc})
      : _todosBloc = todosBloc,
        super(TodosStatusLoading()) {
    // Register the UpdateTodosStatus event handler
    on<UpdateTodosStatus>(_onUpdateTodosStatus);

    // Subscribe to the TodosBloc stream and listen for state changes
    _todosSubscription = _todosBloc.stream.listen((state) {
      // When TodosLoaded state is received, trigger the UpdateTodosStatus event
      if (state is TodosLoaded) {
        add(
          UpdateTodosStatus(todos: state.todos),
        );
      }
    });
  }

  // Event handler for updating todos status
  void _onUpdateTodosStatus(
    UpdateTodosStatus event,
    Emitter<TodosStatusState> emit,
  ) {
    // Filter todos based on their status
    List<Todo> pendingTodos = event.todos
        .where((todo) => todo.isCancelled == false && todo.isCompleted == false)
        .toList();
    List<Todo> completedTodos = event.todos
        .where((todo) => todo.isCompleted == true && todo.isCancelled == false)
        .toList();
    List<Todo> cancelledTodos =
        event.todos.where((todo) => todo.isCancelled == false).toList();

    // Emit a new TodosStatusLoaded state with categorized todos
    emit(
      TodosStatusLoaded(
        pendingTodos: pendingTodos,
        completedTodos: completedTodos,
        cancelledTodos: cancelledTodos,
      ),
    );
  }

  // Override the close method to cancel the TodosBloc subscription
  @override
  Future<void> close() {
    _todosSubscription.cancel();
    return super.close();
  }
}
