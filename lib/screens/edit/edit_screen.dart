//-----------------------------------------------------------------------------------------------------------------------------
//? Things to do:
//
//   1. Build the UI by composing from its components, i.e., Bar and Body.
//      Besides, you will also need to pass the 'states' to the components.
//-----------------------------------------------------------------------------------------------------------------------------

import 'package:exercise3/screens/edit/bar.dart';
import 'package:flutter/material.dart';

import '../../models/todo.dart';
import 'body.dart';

class EditScreen extends StatefulWidget {
  static Route route({isEditing = true, data}) => MaterialPageRoute(
      builder: (context) => EditScreen(isEditing: isEditing, data: data));

  final bool _isEditing;
  final Todo _data;

  get isEditing => _isEditing;

  get data => _data;

  EditScreen({isEditing, data})
      : _isEditing = isEditing,
        _data = data;

  @override
  EditScreenState createState() => EditScreenState(isEditing, data);
}

class EditScreenState extends State<EditScreen> {
  String _title;
  String _description;
  bool _done;

  bool _isEditScreen;
  Todo _data;

  get title => _title;
  set title(value) => _title = value;

  get description => _description;
  set description(value) => _description = value;

  get done => _done;
  set done(value) => _done = value;

  get isEditScreen => _isEditScreen;
  set isEditScreen(value) => _isEditScreen = value;

  get data => _data;
  set data(value) => _data = value;

  Todo makeNewTodo() {
    Todo newTodo;
    if (isEditScreen == false) {
      newTodo = Todo(title: title, description: description, done: false);
    } else {
      newTodo = Todo(title: title, description: description, done: done);
    }
    return newTodo;
  }

  void toggleTick() {
    setState(() {
      done = !done;
    });
  }

  EditScreenState(bool isEditing, Todo data) {
    isEditScreen = isEditing;
    title = data.title;
    description = data.description;
    done = data.done;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: SafeArea(
        child: Scaffold(
          appBar: Bar(
            state: this,
          ),
          body: Body(
            state: this,
          ),
        ),
      ),
    );
  }
}
