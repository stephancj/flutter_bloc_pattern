// Import the necessary package and file
part of 'todos_status_bloc.dart';

// Define an abstract class TodosStatusState that extends Equatable
abstract class TodosStatusState extends Equatable {
  const TodosStatusState();

  // Override the props getter to provide a list of properties for equality comparison
  @override
  List<Object> get props => [];
}

// Define a class TodosStatusLoading that extends TodosStatusState, representing the loading state
class TodosStatusLoading extends TodosStatusState {}

// Define a class TodosStatusLoaded that extends TodosStatusState, representing the state with loaded todos
class TodosStatusLoaded extends TodosStatusState {
  // Define final properties for categorized todos
  final List<Todo> pendingTodos;
  final List<Todo> completedTodos;
  final List<Todo> cancelledTodos;

  // Constructor for TodosStatusLoaded with optional parameters initialized to empty lists
  const TodosStatusLoaded({
    this.pendingTodos = const <Todo>[],
    this.completedTodos = const <Todo>[],
    this.cancelledTodos = const <Todo>[],
  });

  // Override the props getter to include the categorized todos for equality comparison
  @override
  List<Object> get props => [
        pendingTodos,
        completedTodos,
        cancelledTodos,
      ];
}
