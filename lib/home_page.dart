import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit.dart';
import 'package:flutter_cubit/model.dart';

class Home extends StatelessWidget {
  final controllers = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var todoCubit = BlocProvider.of<TodoCubit>(context);
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<TodoCubit, Todo>(
        builder: (context, todo) {
          return Column(
            children: [
              Expanded(
                child: ListView(
                  children: todo.tasks
                      .map(
                        (e) => ListTile(
                          title: Text(e.text),
                          trailing: IconButton(
                            onPressed: () {
                              todoCubit.remove(e);
                            },
                            icon: Icon(Icons.delete),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controllers,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      todoCubit.add(
                        Task(text: controllers.text),
                      );
                      controllers.clear();
                    },
                    child: Text('Add'),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
