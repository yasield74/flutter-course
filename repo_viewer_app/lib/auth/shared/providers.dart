import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer_app/auth/application/auth_notifier.dart';
import 'package:repo_viewer_app/auth/infrastructure/credentials_storage/credentials_storage.dart';
import 'package:repo_viewer_app/auth/infrastructure/credentials_storage/secure_credentials_storage.dart';
import 'package:repo_viewer_app/auth/infrastructure/github_authenticator.dart';

final dioProvider = Provider(
  (ref) => Dio(),
);

final flutterSecureStorageProvider = Provider(
  (ref) => const FlutterSecureStorage(),
);
final credentialStorageProvider = Provider<CredentialStorage>(
    (ref) => SecureCredentialsStorage(ref.watch(flutterSecureStorageProvider)));

final gitHubAuthenticatorProvider = Provider(
  (ref) => GithubAuthenticator(
      ref.watch(credentialStorageProvider), ref.watch(dioProvider)),
);

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AuthState>(
    (ref) => AuthNotifier(ref.watch(gitHubAuthenticatorProvider)));
