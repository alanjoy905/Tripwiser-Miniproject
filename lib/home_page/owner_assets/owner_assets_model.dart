import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/hotel_authentication_info/hotel_authentication_info_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OwnerAssetsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for ServiceName widget.
  TextEditingController? serviceNameController1;
  String? Function(BuildContext, String?)? serviceNameController1Validator;
  // State field(s) for ServiceName widget.
  TextEditingController? serviceNameController2;
  String? Function(BuildContext, String?)? serviceNameController2Validator;
  // State field(s) for ServiceName widget.
  TextEditingController? serviceNameController3;
  String? Function(BuildContext, String?)? serviceNameController3Validator;
  // State field(s) for LicenseNumber widget.
  TextEditingController? licenseNumberController;
  String? Function(BuildContext, String?)? licenseNumberControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    serviceNameController1?.dispose();
    serviceNameController2?.dispose();
    serviceNameController3?.dispose();
    licenseNumberController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
