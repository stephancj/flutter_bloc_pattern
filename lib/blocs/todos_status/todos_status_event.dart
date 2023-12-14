// Import the necessary package and file
part of 'todos_status_bloc.dart';

// Define an abstract class TodosStatusEvent that extends Equatable
abstract class TodosStatusEvent extends Equatable {
  const TodosStatusEvent();

  // Override the props getter to provide a list of properties for equality comparison
  @override
  List<Object> get props => [];
}

// Define a class UpdateTodosStatus that extends TodosStatusEvent
class UpdateTodosStatus extends TodosStatusEvent {
  // Define a final property 'todos' of type List<Todo>
  final List<Todo> todos;

  // Constructor for UpdateTodosStatus with an optional parameter 'todos' initialized to an empty list
  const UpdateTodosStatus({this.todos = const <Todo>[]});

  // Override the props getter to include the 'todos' property for equality comparison
  @override
  List<Object> get props => [todos];
}
