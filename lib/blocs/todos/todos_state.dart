// Import the necessary package and file
part of 'todos_bloc.dart';

// Define an abstract class TodosState that extends Equatable
abstract class TodosState extends Equatable {
  const TodosState();

  // Override the props getter to provide a list of properties for equality comparison
  @override
  List<Object> get props => [];
}

// Define a class TodosLoading that extends TodosState, representing the loading state
class TodosLoading extends TodosState {}

// Define a class TodosLoaded that extends TodosState, representing the state with loaded todos
class TodosLoaded extends TodosState {
  // Define a final property 'todos' of type List<Todo>
  final List<Todo> todos;

  // Constructor for TodosLoaded with an optional parameter 'todos' initialized to an empty list
  const TodosLoaded({
    this.todos = const <Todo>[],
  });

  // Override the props getter to include the 'todos' property for equality comparison
  @override
  List<Object> get props => [todos];
}

// Define a class TodosError that extends TodosState, representing the error state
class TodosError extends TodosState {}
