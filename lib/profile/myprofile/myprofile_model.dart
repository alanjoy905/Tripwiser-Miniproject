import '/auth/firebase_auth/auth_util.dart';
import '/components/dark_light_mode_switch/dark_light_mode_switch_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class MyprofileModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for DarkLightModeSwitch component.
  late DarkLightModeSwitchModel darkLightModeSwitchModel;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    darkLightModeSwitchModel =
        createModel(context, () => DarkLightModeSwitchModel());
  }

  void dispose() {
    unfocusNode.dispose();
    darkLightModeSwitchModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
