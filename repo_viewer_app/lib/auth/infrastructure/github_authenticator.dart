import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:oauth2/oauth2.dart';
import 'package:repo_viewer_app/auth/domain/auth_failure.dart';
import 'package:repo_viewer_app/auth/infrastructure/credentials_storage/credentials_storage.dart';
import 'package:http/http.dart' as http;
import 'package:repo_viewer_app/core/infrastructure/dio_extensions.dart';
import 'package:repo_viewer_app/core/shared/encoders.dart';

class GitHubOAuthHttpClient extends http.BaseClient {
  final httpClient = http.Client();
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    request.headers['Accept'] = 'application/json';
    return httpClient.send(request);
  }
}

class GithubAuthenticator {
  final CredentialStorage _credentialStorage;
  final Dio _dio;

  GithubAuthenticator(this._credentialStorage, this._dio);

  static final authorizationEndpoint =
      Uri.parse('https://github.com/login/oauth/authorize');
  static final tokenEndpoint =
      Uri.parse('https://github.com/login/oauth/access_token');
  static final redirectUrl = Uri.parse('http://localhost:3000/callback');
  static const clientId = 'e3c6188812ba2515852f';
  static const clientSecret = '246c82a6549c113a386620216b6927f650ed7995';
  //TODO: Check the scope for the GitHub, i wasnt able to find it, will this work without adding it ?
  static const scopes = ['read:user', 'repo'];

  static final revocationEndpoint =
      Uri.parse('https://api.github.com/applications/$clientId/token');

  Future<Credentials?> getSignedInCredentials() async {
    try {
      final storedCredentials = await _credentialStorage.read();
      if (storedCredentials != null) {
        if (storedCredentials.canRefresh && storedCredentials.isExpired) {
          final failureOrCredentials = await refresh(storedCredentials);
          return failureOrCredentials.fold((l) => null, (r) => r);
        }
      }
      return storedCredentials;
    } on PlatformException {
      return null;
    }
  }

  Uri getAuthorizationUrl(AuthorizationCodeGrant grant) {
    return grant.getAuthorizationUrl(redirectUrl, scopes: scopes);
  }

  Future<bool> isSingedIn() =>
      getSignedInCredentials().then((credentials) => credentials != null);

  AuthorizationCodeGrant createGrant() {
    return AuthorizationCodeGrant(
        clientId, authorizationEndpoint, tokenEndpoint,
        secret: clientSecret, httpClient: GitHubOAuthHttpClient());
  }

  Future<Either<AuthFailure, Unit>> handleAuthorizationResponse(
    AuthorizationCodeGrant grant,
    Map<String, String> queryParams,
  ) async {
    try {
      final httpClient = await grant.handleAuthorizationResponse(queryParams);
      await _credentialStorage.save(httpClient.credentials);
      return right(unit);
    } on FormatException {
      return left(const AuthFailure.server());
    } on AuthorizationException catch (e) {
      return left(AuthFailure.server('${e.error} : ${e.description}'));
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }

  Future<Either<AuthFailure, Unit>> signOut() async {
    final accessToken = await _credentialStorage
        .read()
        .then((credentials) => credentials?.accessToken);

    final userNameAndPassword =
        stringToBase64.encode('$clientId:$clientSecret');

    try {
      try {
        //revoque the Authorization code from server.
        _dio.deleteUri(revocationEndpoint,
            data: {'access_token': accessToken},
            options: Options(
                headers: {'Authorization': 'basic $userNameAndPassword'}));
      } on DioException catch (e) {
        if (e.isNoConnectionError) {
          //Ignoring
        } else {
          rethrow;
        }
      }
      //Clear the credentials from the storage.
      await _credentialStorage.clear();
      return right(unit);
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }

  Future<Either<AuthFailure, Credentials>> refresh(
      Credentials credentials) async {
    try {
      final refreshCredentials = await credentials.refresh(
          identifier: clientId,
          secret: clientSecret,
          httpClient: GitHubOAuthHttpClient());
      await _credentialStorage.save(refreshCredentials);
      return right(refreshCredentials);
    } on FormatException {
      return left(const AuthFailure.server());
    } on AuthorizationException catch (e) {
      return left(AuthFailure.server('${e.error}:  ${e.description}'));
    } on PlatformException {
      return left(const AuthFailure.storage());
    }
  }
}
