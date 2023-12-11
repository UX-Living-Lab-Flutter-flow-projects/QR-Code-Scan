import '/components/global_top_menu_bar_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for GlobalTopMenuBar component.
  late GlobalTopMenuBarModel globalTopMenuBarModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    globalTopMenuBarModel = createModel(context, () => GlobalTopMenuBarModel());
  }

  void dispose() {
    unfocusNode.dispose();
    globalTopMenuBarModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
