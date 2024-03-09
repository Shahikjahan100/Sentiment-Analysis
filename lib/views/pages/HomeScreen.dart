import 'package:emotion_recognition/controllers/signIn_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderSignIn(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: Container(
            child: Consumer<ProviderSignIn>(
              builder: (context, signin, child) {
                return Center(
                  child: Text("Welcome, ${signin.getUser()}"),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
