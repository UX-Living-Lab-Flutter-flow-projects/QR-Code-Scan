import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  bool showSplashImage = true;

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) => appStateNotifier.showSplashImage
          ? Builder(
              builder: (context) => Container(
                color: Colors.transparent,
                child: Center(
                  child: Image.asset(
                    'assets/images/Logo_500*500.png',
                    width: MediaQuery.sizeOf(context).width * 0.75,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            )
          : LoginComponentWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.showSplashImage
              ? Builder(
                  builder: (context) => Container(
                    color: Colors.transparent,
                    child: Center(
                      child: Image.asset(
                        'assets/images/Logo_500*500.png',
                        width: MediaQuery.sizeOf(context).width * 0.75,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                )
              : LoginComponentWidget(),
          routes: [
            FFRoute(
              name: 'login',
              path: 'login',
              builder: (context, params) => LoginWidget(),
            ),
            FFRoute(
              name: 'CreateAccount1',
              path: 'createAccount1',
              builder: (context, params) => CreateAccount1Widget(),
            ),
            FFRoute(
              name: 'CreateQRcode2',
              path: 'createQRcode2',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'CreateQRcode2')
                  : CreateQRcode2Widget(),
            ),
            FFRoute(
              name: 'homScreen',
              path: 'homScreen',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'homScreen')
                  : HomScreenWidget(),
            ),
            FFRoute(
              name: 'QRcodeScreen1',
              path: 'qRcodeScreen1',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'QRcodeScreen1')
                  : QRcodeScreen1Widget(),
            ),
            FFRoute(
              name: 'CreateQRcode3',
              path: 'createQRcode3',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: CreateQRcode3Widget(
                  qrID: params.getParam('qrID', ParamType.String),
                ),
              ),
            ),
            FFRoute(
              name: 'CreateQRcode4',
              path: 'createQRcode4',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: CreateQRcode4Widget(
                  codeId: params.getParam('codeId', ParamType.String),
                  colorQR: params.getParam('colorQR', ParamType.String),
                ),
              ),
            ),
            FFRoute(
              name: 'QRcodeScreen2',
              path: 'qRcodeScreen2',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: QRcodeScreen2Widget(
                  idQ: params.getParam('idQ', ParamType.String),
                  coloID: params.getParam('coloID', ParamType.String),
                ),
              ),
            ),
            FFRoute(
              name: 'QRcodeScreen3',
              path: 'qRcodeScreen3',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: QRcodeScreen3Widget(
                  qrName: params.getParam('qrName', ParamType.String),
                  idForActive: params.getParam('idForActive', ParamType.String),
                ),
              ),
            ),
            FFRoute(
              name: 'LoginComponent',
              path: 'loginComponent',
              builder: (context, params) => LoginComponentWidget(),
            ),
            FFRoute(
              name: 'Settings',
              path: 'settings',
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'Settings')
                  : SettingsWidget(),
            ),
            FFRoute(
              name: 'test',
              path: 'test',
              builder: (context, params) => TestWidget(),
            ),
            FFRoute(
              name: 'signup',
              path: 'signup',
              builder: (context, params) => SignupWidget(),
            ),
            FFRoute(
              name: 'edit_profile',
              path: 'editProfile',
              builder: (context, params) => EditProfileWidget(),
            ),
            FFRoute(
              name: 'Privacy_policy',
              path: 'privacyPolicy',
              builder: (context, params) => PrivacyPolicyWidget(),
            ),
            FFRoute(
              name: 'security_page',
              path: 'securityPage',
              builder: (context, params) => SecurityPageWidget(),
            ),
            FFRoute(
              name: 'qrDetail',
              path: 'qrDetail',
              builder: (context, params) => QrDetailWidget(),
            ),
            FFRoute(
              name: 'EditQrCode',
              path: 'editQrCode',
              builder: (context, params) => NavBarPage(
                initialPage: '',
                page: EditQrCodeWidget(),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.extraMap.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, [
    bool isList = false,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouter.of(context).location;
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}
