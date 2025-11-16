import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/task_cubit.dart';
import 'package:todo/task_model.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:  TodoScreen(),
    );
  }
}

class TodoScreen extends StatelessWidget {
   TodoScreen({super.key});
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocProvider(
        create: (context) => TaskCubit(),
        child: BlocBuilder<TaskCubit,TaskState>(builder: (context,state){
          final blocContoller = context.read<TaskCubit>();
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: .center,
                children: [
                  SizedBox(height: 100,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: textEditingController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter todo item',
                      ),),
                  ),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      ElevatedButton(onPressed: (){
                        context.read<TaskCubit>().addTask(TaskModel(id: Uuid().v4(), title: textEditingController.text, isCompleted: true));
                      }, child: Text('Cancel')  ,),
                      ElevatedButton(onPressed: () {
                        context.read<TaskCubit>().addTask(
                          TaskModel(id: DateTime.now().millisecondsSinceEpoch.toString(),
                              title: textEditingController.text,
                              isCompleted: false),
                        );
                      }, child: Text('Add')  ,
                      ),

                      ElevatedButton(onPressed: (){
                        context.read<TaskCubit>().addTaskByTitle(textEditingController.text);
                      }, child: Text('Add')  ,)
                    ],
                  ),
                  Text('Todo App'),
                  Expanded(child: ListView.builder(
                    itemCount: state.taskList.length,
                    itemBuilder: (context,index){
                      final task = state.taskList[index];
                      return ListTile(
                        title: Text(task.title),
                        leading: Checkbox(
                          value: task.isCompleted,
                          onChanged: (value) {
                            context.read<TaskCubit>().tpggleTask(task.id);
                          },
                        ),
                        trailing: IconButton(onPressed: (){
                          blocContoller.removeTask(task.id);
                        }, icon: Icon(Icons.delete)),
                        onLongPress: (){
                          if(textEditingController.text.isEmpty) return;
                          blocContoller.removeTask(task.id);
                        },
                      );
                    },
                  ))
                ],
              ),
            ),
          );
        }),
    ));
  }
}

@Preview()
Widget buildTodoScreen() {
  return Center(
    child: Column(
      children: [
        Text('Todo App'),
        Text('Todo App'),
        Text('Todo App'),
        Text('Todo App'),
        Text('Todo App'),
      ],
    ),
  );
}