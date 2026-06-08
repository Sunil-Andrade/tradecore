import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login(String email, String password) async {
    emit(AuthLoading());

    final result = await http.post(
      Uri.parse("http://localhost:3000/login"),
      body: jsonEncode({"email": email, "password": password}),
    );

    print(result.statusCode == 200);

    emit(AuthSuccess());
  }
}
