import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'security_page_model.dart';
export 'security_page_model.dart';

class SecurityPageWidget extends StatefulWidget {
  const SecurityPageWidget({Key? key}) : super(key: key);

  @override
  _SecurityPageWidgetState createState() => _SecurityPageWidgetState();
}

class _SecurityPageWidgetState extends State<SecurityPageWidget> {
  late SecurityPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SecurityPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FlutterFlowIconButton(
                      borderColor: Colors.transparent,
                      borderRadius: 30.0,
                      borderWidth: 1.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.chevron_left,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      onPressed: () {
                        print('IconButton pressed ...');
                      },
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Data Safety  & Security',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 10.0, 10.0, 10.0),
                            child: Text(
                              'Dowell may collect certain personally identifiable information (“personal information”) about you when you visit our App. Examples of personal information we may collect include your name, address, telephone number, fax number, and e-mail address.\nWe also automatically collect certain non-personally identifiable information when you visit our App, including, but not limited to, the location, the type of browser you are using, the type of operating system you are using, and the domain name of your Internet service provider.\n\nAre QR Codes secure?\nQR Codes are secure. Static QR Codes are machine-readable and the content inside them cannot be changed once generated. The content inside a Dynamic QR Code, however, can be changed, but you would need access to the user account that created them in the first place.\nCan QR Codes be hacked?\nThe actual QR Codes themselves can’t be hacked. This is because they are built using a square matrix with pixelated dots so these dots would have to be changed in order to be “hacked.”\nWiFi QR Code technology is not a security risk alone. Security issues arise from the information connected to the QR Code.\nPotential WiFi QR Code security issues\nThere are some associated security risks with scanning QR Codes if they don’t come from a trusted sender. There are three types of security risks related to QR Codes, but keep in mind that these security risks have nothing to do with the technology of QR Codes themselves.\nPhishing\nPhishing is a common way that hackers break into websites. Usually, they start by sending a fake login page for the website via email. An unsuspecting person may find this email quite convincing as they can include company logos and similar graphics styles so it does look like a real company. Once this login information is sent, this allows the attacker easy access to the website.',
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
