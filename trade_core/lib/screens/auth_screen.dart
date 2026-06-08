import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trade_core/appstate/auth_cubit/auth_cubit.dart';
import 'package:trade_core/screens/home_screen.dart';

import 'package:trade_core/widgets/text_input_box.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passditingController = TextEditingController();

  @override
  void dispose() {
    emailEditingController.dispose();
    passditingController.dispose();
    super.dispose();
  }

  void validate(BuildContext context) {
    var email = emailEditingController.text.trim();
    var password = passditingController.text.trim();

    if (email.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Email is Empty")));
      return;
    }
    if (!email.contains('@')) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Invalid Email")));
      return;
    }

    if (password.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Password is empty")));
      return;
    }

    if (password.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password must be 8 charcter long")),
      );
      return;
    }

    context.read<AuthCubit>().login(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "TradeCore",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Text("Create Your Account", style: TextStyle(fontSize: 20)),
          SizedBox(height: 30),
          Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(3),
            child: Container(
              padding: EdgeInsets.all(20),
              height: 300,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 2, color: Colors.grey),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email"),
                  TextInputBox(controller: emailEditingController),
                  SizedBox(height: 20),
                  Text("Password"),
                  TextInputBox(controller: passditingController),
                  SizedBox(height: 20),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is AuthSuccess) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      return InkWell(
                        onTap: () {
                          validate(context);
                        },
                        child: Container(
                          height: 50,
                          color: const Color.fromARGB(255, 9, 71, 177),
                          child: const Center(
                            child: Text(
                              "Create Account",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
