//-----------------------------------------------------------------------------------------------------------------------------
//? Things to do:
//   Define the following methods to handle REST calls about the Todo data
//    to the REST service.
//       a. getTodoListByUser: to get all the todos for a user (with given user id).
//       b. addTodo: to add a new todo.
//       c. updateTodo: to edit a todo.
//       d. removeTodo: to delete a todo
//-----------------------------------------------------------------------------------------------------------------------------

import 'rest.dart';
import '../models/todo.dart';

class TodoService {
  static Future<List<Todo>> getTodoListByUser(int userId) async {
    List<dynamic> listTodoForUser = await Rest.get('todos');
    // print(listTodoForUser.runtimeType);
    List<dynamic> todosbyId =
        listTodoForUser.where((elem) => elem['user'] == userId).toList();
    return todosbyId.map((elem) => Todo.fromJson(elem)).toList();
  }

  static Future<Todo> addTodo(Todo todo) async {
    final json = await Rest.post('todos', data: todo);
    return Todo.fromJson(json);
    // return Todo.fromJson(await Rest.post('todos', data: todo));
  }

  static Future<Todo> updateTodo(Todo todo) async {
    return Todo.fromJson(await Rest.put('todos/${todo.id}', data: todo));
  }

  static Future<void> removeTodo(int todoId) async {
    final deljson = await Rest.delete('todos/$todoId');
    print(deljson);
    return deljson;
  }
}
