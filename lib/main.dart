import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: TodoApp(),
  ));
}

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<String> tasks = [];
  TextEditingController controller = TextEditingController();

  void addTask() {
    if (controller.text.isNotEmpty) {
      setState(() {
        tasks.add(controller.text);
        controller.clear();
      });
    }
  }

  void removeTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de tarefas')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Digite uma tarefa',
              ),
              onSubmitted: (_) => addTask(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(tasks[index]),
                onTap: () => removeTask(index),
              ),
            ),
          ),
        ],
      ),
    );
  }
}