import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'supportpage_model.dart';
export 'supportpage_model.dart';

class SupportpageWidget extends StatefulWidget {
  const SupportpageWidget({Key? key}) : super(key: key);

  @override
  _SupportpageWidgetState createState() => _SupportpageWidgetState();
}

class _SupportpageWidgetState extends State<SupportpageWidget> {
  late SupportpageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SupportpageModel());
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
        appBar: AppBar(
          backgroundColor: Color(0xFF162903),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 20.0,
            borderWidth: 1.0,
            buttonSize: 40.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: FlutterFlowTheme.of(context).primaryText,
              size: 20.0,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
          title: Text(
            FFLocalizations.of(context).getText(
              'n55ifcef' /* Reach the support team */,
            ),
            style: FlutterFlowTheme.of(context).titleSmall,
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 412.0,
                height: 860.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/istockphoto-1177980696-612x612.jpg',
                      width: 412.0,
                      height: 870.0,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          155.0, 150.0, 0.0, 0.0),
                      child: Icon(
                        Icons.support_agent,
                        color: Color(0xFF091101),
                        size: 100.0,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(78.0, 250.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'v99normo' /* WE CAN HELP YOU! */,
                        ),
                        style: FlutterFlowTheme.of(context).titleLarge.override(
                              fontFamily: 'Work Sans',
                              color: Color(0xFF162903),
                              fontSize: 28.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .titleLargeFamily),
                            ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          130.0, 450.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          'q43pjg68' /* send us an email: */,
                        ),
                        style: FlutterFlowTheme.of(context).titleSmall,
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 470.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                95.0, 0.0, 0.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '0z5g1z9r' /* tripwiser23@gmail.com */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleLargeFamily,
                                    color: Color(0xFF091101),
                                    fontSize: 20.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .titleLargeFamily),
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          170.0, 380.0, 0.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: FlutterFlowTheme.of(context).primary,
                        borderRadius: 20.0,
                        borderWidth: 1.0,
                        buttonSize: 60.0,
                        fillColor: Color(0xFF162903),
                        icon: Icon(
                          Icons.mail,
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                          size: 30.0,
                        ),
                        onPressed: () async {
                          await launchUrl(Uri(
                              scheme: 'mailto',
                              path: 'tripwiser23@gmail.com',
                              query: {
                                'subject': 'USER SUPPORT',
                                'body':
                                    'Sorry for the inconvenience caused.Please mention how can we help you.Our team will  be contacting soon! ',
                              }
                                  .entries
                                  .map((MapEntry<String, String> e) =>
                                      '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                  .join('&')));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
