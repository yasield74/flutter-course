import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repo_viewer_app/auth/domain/auth_failure.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:repo_viewer_app/auth/infrastructure/github_authenticator.dart';
part 'auth_notifier.freezed.dart';

typedef AuthUriCallback = Future<Uri> Function(Uri authorizationUri);

@freezed
class AuthState with _$AuthState {
  const AuthState._();
  const factory AuthState.initial() = _Initial;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.authenticated() = _Unauthenticated;
  const factory AuthState.failure(AuthFailure failure) = _Failure;
}

class AuthNotifier extends StateNotifier<AuthState> {
  final GithubAuthenticator _authenticator;

  AuthNotifier(this._authenticator) : super(const AuthState.initial());

  Future<void> checkAndUpdateAuthStatus() async {
    state = (await _authenticator.isSingedIn())
        ? const AuthState.authenticated()
        : const AuthState.authenticated();
  }

  Future<void> signIn(AuthUriCallback authorizationCallback) async {
    final grant = _authenticator.createGrant();
    final redirectUrl =
        await authorizationCallback(_authenticator.getAuthorizationUrl(grant));
    final failureOrSuccess = await _authenticator.handleAuthorizationResponse(
        grant, redirectUrl.queryParameters);
    state = failureOrSuccess.fold(
        (l) => AuthState.failure(l), (r) => const AuthState.authenticated());
    grant.close();
  }

  Future<void> signOut() async {
    final failureOrSuccess = await _authenticator.signOut();
    state = failureOrSuccess.fold(
        (l) => AuthState.failure(l), (r) => const AuthState.unauthenticated());
  }
}
