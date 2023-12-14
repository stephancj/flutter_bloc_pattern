// Import the necessary package and file
part of 'todos_bloc.dart';

// Define an abstract class TodoEvent that extends Equatable
abstract class TodoEvent extends Equatable {
  const TodoEvent();

  // Override the props getter to provide a list of properties for equality comparison
  @override
  List<Object> get props => [];
}

// Define a class LoadTodos that extends TodoEvent
class LoadTodos extends TodoEvent {
  // Define a final property 'todos' of type List<Todo>
  final List<Todo> todos;

  // Constructor for LoadTodos with an optional parameter 'todos' initialized to an empty list
  const LoadTodos({
    this.todos = const <Todo>[],
  });

  // Override the props getter to include the 'todos' property for equality comparison
  @override
  List<Object> get props => [todos];
}

// Define a class AddTodo that extends TodoEvent
class AddTodo extends TodoEvent {
  // Define a final property 'todo' of type Todo
  final Todo todo;

  // Constructor for AddTodo with a required parameter 'todo'
  const AddTodo({
    required this.todo,
  });

  // Override the props getter to include the 'todo' property for equality comparison
  @override
  List<Object> get props => [todo];
}

// Define a class UpdateTodo that extends TodoEvent
class UpdateTodo extends TodoEvent {
  // Define a final property 'todo' of type Todo
  final Todo todo;

  // Constructor for UpdateTodo with a required parameter 'todo'
  const UpdateTodo({
    required this.todo,
  });

  // Override the props getter to include the 'todo' property for equality comparison
  @override
  List<Object> get props => [todo];
}

// Define a class DeleteTodo that extends TodoEvent
class DeleteTodo extends TodoEvent {
  // Define a final property 'todo' of type Todo
  final Todo todo;

  // Constructor for DeleteTodo with a required parameter 'todo'
  const DeleteTodo({
    required this.todo,
  });

  // Override the props getter to include the 'todo' property for equality comparison
  @override
  List<Object> get props => [todo];
}
