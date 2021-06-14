//-----------------------------------------------------------------------------------------------------------------------------
//? Things to do:
//   1. Build this screen with conditional UI technique (based on
//      whether it is for 'editing an existing todo' or 'creating a new todo').
//      This includes:
//        a. The 'done' field will only be enabled if it is an 'editing' mode
//
//   2. Update the states and reflect the changes on the UI:
//        a. when the user types in the 'title'.
//        b. when the user types in the 'description'.
//        c. when the user taps on the 'done' checkbox.
//
//   3. Perform the following operations:
//        a. Accept the updated / created item - i.e. when the 'Ok' button is tapped on.
//        b. Cancel the changes - i.e. when the 'Cancel' button is tapped on.
//-----------------------------------------------------------------------------------------------------------------------------

import 'package:exercise3/models/todo.dart';
import 'package:flutter/material.dart';

import 'edit_screen.dart';

class Body extends StatelessWidget {
  const Body({state}) : _state = state;

  final EditScreenState _state;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildTextLisTile(
            label: 'Title',
            value: _state.title,
            onChanged: (value) => _state.title = value),
        _buildTextLisTile(
            label: 'Description',
            value: _state.description,
            onChanged: (value) => _state.description = value),
        if (_state.isEditScreen == true)
          Center(
            child: CheckboxListTile(
              value: _state.done,
              selected: _state.done,
              onChanged: (value) {
                _state.toggleTick();
              },
              title: Text('Done'),
            ),
          )
        else
          Center(),
        _buildButtons(context)
      ],
    );
  }

  ListTile _buildTextLisTile({label, value, onChanged}) {
    return ListTile(
      title: TextFormField(
        initialValue: value,
        decoration: InputDecoration(
          labelText: label,
        ),
        onChanged: onChanged,
      ),
    );
  }

  Row _buildButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            child: Text('Ok'),
            onPressed: () async {
              if (_state.title != null && _state.description != null) {
                return Navigator.pop(context, _state.makeNewTodo());
              } else {
                return Navigator.pop(context);
              }
            }),
        SizedBox(width: 10.0),
        ElevatedButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
