import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  late final _supabase = Supabase.instance.client;

  User? get user => _supabase.auth.currentUser;
  bool get isLoggedIn => user != null;

  Future<AuthResponse> emailSignUp(String email, String password) async {
    _supabase.auth.currentUser;
    return await _supabase.auth.signUp(email: email, password: password);
  }

  Future signOut() async {
    await _supabase.auth.signOut();
  }
}

final authRepository = Provider((ref) => AuthRepository());
