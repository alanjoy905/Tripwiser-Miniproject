import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'booking_confirmation_model.dart';
export 'booking_confirmation_model.dart';

class BookingConfirmationWidget extends StatefulWidget {
  const BookingConfirmationWidget({Key? key}) : super(key: key);

  @override
  _BookingConfirmationWidgetState createState() =>
      _BookingConfirmationWidgetState();
}

class _BookingConfirmationWidgetState extends State<BookingConfirmationWidget> {
  late BookingConfirmationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BookingConfirmationModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 270.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(0.0, -3.0),
          )
        ],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Container(
        width: 100.0,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(20.0, 10.0, 20.0, 10.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      'qi3p3a1u' /* "Booking Confirmation: Email N... */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                  child: Text(
                    FFLocalizations.of(context).getText(
                      '95hy5wsm' /* Thank you for your booking! Yo... */,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300,
                          useGoogleFonts: GoogleFonts.asMap().containsKey(
                              FlutterFlowTheme.of(context).bodyMediumFamily),
                        ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
              child: FFButtonWidget(
                onPressed: () async {
                  _model.booksuccess =
                      await BackendflowPdfgenBookedSuccessfullyGroup
                          .pdfgenBookedSuccessfullyCall
                          .call(
                    hotelServiceName: valueOrDefault(
                        currentUserDocument?.hotelServiceName, ''),
                    name: currentUserDisplayName,
                    selectedRoomsCount: valueOrDefault(
                            currentUserDocument?.selectedRoomsNumber, 0)
                        .toString(),
                    rateperday:
                        valueOrDefault(currentUserDocument?.rateperday, 0)
                            .toString(),
                  );
                  _model.successBook =
                      await BackendflowEmailBookSuccessEmailGroup
                          .emailBookSuccessEmailCall
                          .call(
                    to: currentUserEmail,
                    attachmentLink: (_model.booksuccess?.bodyText ?? ''),
                    name: currentUserDisplayName,
                  );
                  _model.infotoowner =
                      await BackendflowEmailBookInfoToOwnerGroup
                          .emailBookInfoToOwnerCall
                          .call(
                    to: valueOrDefault(currentUserDocument?.oEmail, ''),
                    name: currentUserDisplayName,
                    selectedRoomsCount: valueOrDefault(
                            currentUserDocument?.selectedRoomsNumber, 0)
                        .toString(),
                    email: valueOrDefault<String>(
                      currentUserEmail,
                      'alanjoy905@gmail.com ',
                    ),
                    phoneNumber: currentPhoneNumber,
                    subject: 'New Room Booking From Tripwiser User !',
                  );
                  await showDialog(
                    context: context,
                    builder: (alertDialogContext) {
                      return AlertDialog(
                        title: Text('Booking SuccSuccessfull !'),
                        content: Text('Your Room Booking Is Successfull'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(alertDialogContext),
                            child: Text('Ok !'),
                          ),
                        ],
                      );
                    },
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Thank you for your booking! Your reservation has been successfully confirmed.  Please note that you will receive a notification email shortly, which will serve as your temporary booking ticket. This email will contain all the necessary details of your reservation, including the date of arrival, departure, room type, and any additional services you requested!',
                        style: TextStyle(
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                      ),
                      duration: Duration(milliseconds: 4000),
                      backgroundColor: FlutterFlowTheme.of(context).secondary,
                    ),
                  );

                  context.pushNamed(
                    'UserHomePage',
                    extra: <String, dynamic>{
                      kTransitionInfoKey: TransitionInfo(
                        hasTransition: true,
                        transitionType: PageTransitionType.fade,
                        duration: Duration(milliseconds: 500),
                      ),
                    },
                  );

                  setState(() {});
                },
                text: FFLocalizations.of(context).getText(
                  'vazfowck' /* Continue */,
                ),
                options: FFButtonOptions(
                  width: 200.0,
                  height: 37.0,
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: Color(0xFF00AA77),
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).titleSmallFamily,
                        color: Colors.white,
                        fontSize: 14.0,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).titleSmallFamily),
                      ),
                  elevation: 3.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(40.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
