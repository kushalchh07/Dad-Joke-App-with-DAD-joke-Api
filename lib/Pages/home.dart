// ignore_for_file: use_key_in_widget_constructors

import 'package:dad_joke/Bloc/Joke_Bloc/joke_bloc.dart';
import 'package:dad_joke/Bloc/Joke_Bloc/joke_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Bloc/Joke_Bloc/joke_event.dart';

class DadJokeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dad Joke Generator'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<DadJokeBloc, DadJokeState>(
                builder: (context, state) {
                  if (state is DadJokeInitial) {
                    return Text("Press 'Generate' to get a dad joke!");
                  } else if (state is DadJokeLoading) {
                    return CupertinoActivityIndicator();
                  } else if (state is DadJokeLoaded) {
                    return Text(
                      state.joke.joke,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    );
                  } else if (state is DadJokeError) {
                    return Text(
                      state.message,
                      style: TextStyle(color: Colors.red),
                    );
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.read<DadJokeBloc>().add(GenerateJokeEvent());
                },
                child: Text('Generate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
