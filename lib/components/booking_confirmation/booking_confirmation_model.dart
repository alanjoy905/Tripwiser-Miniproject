import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class BookingConfirmationModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (pdfgenBookedSuccessfully)] action in Button widget.
  ApiCallResponse? booksuccess;
  // Stores action output result for [Backend Call - API (emailBookSuccessEmail)] action in Button widget.
  ApiCallResponse? successBook;
  // Stores action output result for [Backend Call - API (emailBookInfoToOwner)] action in Button widget.
  ApiCallResponse? infotoowner;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {}

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
