import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'termsandconditions_model.dart';
export 'termsandconditions_model.dart';

class TermsandconditionsWidget extends StatefulWidget {
  const TermsandconditionsWidget({Key? key}) : super(key: key);

  @override
  _TermsandconditionsWidgetState createState() =>
      _TermsandconditionsWidgetState();
}

class _TermsandconditionsWidgetState extends State<TermsandconditionsWidget> {
  late TermsandconditionsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TermsandconditionsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      context.safePop();
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/images/istockphoto-1177980696-612x612.jpg',
                    width: 412.0,
                    height: 916.0,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(65.0, 40.0, 0.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'p54i67z6' /* TERMS AND CONDITIONS */,
                      ),
                      style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Merriweather',
                            color: Color(0xFF162903),
                            fontSize: 22.0,
                            fontWeight: FontWeight.w800,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).titleLargeFamily),
                          ),
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(30.0, 40.0, 0.0, 0.0),
                    child: Icon(
                      Icons.library_books_sharp,
                      color: Color(0xFF162903),
                      size: 30.0,
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(25.0, 90.0, 25.0, 0.0),
                    child: Text(
                      FFLocalizations.of(context).getText(
                        'krvi17hg' /* 1.Acceptance of Terms: Users a... */,
                      ),
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodySmallFamily,
                            color: Color(0xFF091101),
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodySmallFamily),
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
