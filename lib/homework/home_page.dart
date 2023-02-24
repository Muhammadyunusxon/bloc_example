import 'package:bloc_example/homework/checker_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.title = 'Bloc'});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    debugPrint("main build");
    return BlocListener<CheckerCubit, CheckerState>(
      listenWhen: (prev,current){
        return prev.title !=name.text;
      },
      listener: (context, state) {
        if (state.title == name.text) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: const Text('Awesome Snackbar!'),
              action: SnackBarAction(
                label: 'Well done',
                onPressed: () {},
              ),
            ),
          );
        } else {
          showDialog(
              context: context,
              builder: (_) => const AlertDialog(
                    title: Text("Error"),
                  ));
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocBuilder<CheckerCubit, CheckerState>(
                buildWhen: (prev, current) {
                  return current.title != prev.title;
                },
                builder: (context, state) {
                  debugPrint("bloc build counter");
                  return Text(
                    state.title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const SizedBox(height: 4),
            FloatingActionButton(
              child: const Icon(Icons.edit),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          title: TextFormField(
                            controller: name,
                          ),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Save"))
                          ],
                        ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
