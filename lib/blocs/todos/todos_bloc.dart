// Import necessary packages and files
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '/models/models.dart'; // Import the necessary models

// Import event and state classes
part 'todos_event.dart';
part 'todos_state.dart';

// Define a BLoC class named TodosBloc that extends Bloc
class TodosBloc extends Bloc<TodoEvent, TodosState> {
  // Constructor for the TodosBloc, initializes with TodosLoading state
  TodosBloc() : super(TodosLoading()) {
    // Register event handlers
    on<LoadTodos>(_onLoadTodos);
    on<AddTodo>(_onAddTodo);
    on<DeleteTodo>(_onDeleteTodo);
    on<UpdateTodo>(_onUpdateTodo);
  }

  // Event handler for loading todos
  void _onLoadTodos(
    LoadTodos event,
    Emitter<TodosState> emit,
  ) {
    // Emit a new TodosLoaded state with the provided todos
    emit(TodosLoaded(todos: event.todos));
  }

  // Event handler for adding a todo
  void _onAddTodo(
    AddTodo event,
    Emitter<TodosState> emit,
  ) {
    // Retrieve the current state
    final state = this.state;
    // Check if the current state is TodosLoaded
    if (state is TodosLoaded) {
      // Emit a new TodosLoaded state with the added todo
      emit(
        TodosLoaded(
          todos: List.from(state.todos)..add(event.todo),
        ),
      );
    }
  }

  // Event handler for deleting a todo
  void _onDeleteTodo(
    DeleteTodo event,
    Emitter<TodosState> emit,
  ) {
    // Retrieve the current state
    final state = this.state;
    // Check if the current state is TodosLoaded
    if (state is TodosLoaded) {
      // Create a new list of todos excluding the one to be deleted
      List<Todo> todos = (state.todos.where((todo) {
        return todo.id != event.todo.id;
      })).toList();

      // Emit a new TodosLoaded state with the updated list of todos
      emit(TodosLoaded(todos: todos));
    }
  }

  // Event handler for updating a todo
  void _onUpdateTodo(
    UpdateTodo event,
    Emitter<TodosState> emit,
  ) {
    // Retrieve the current state
    final state = this.state;
    // Check if the current state is TodosLoaded
    if (state is TodosLoaded) {
      // Create a new list of todos with the updated todo
      List<Todo> todos = (state.todos.map((todo) {
        return todo.id == event.todo.id ? event.todo : todo;
      })).toList();

      // Emit a new TodosLoaded state with the updated list of todos
      emit(TodosLoaded(todos: todos));
    }
  }
}
