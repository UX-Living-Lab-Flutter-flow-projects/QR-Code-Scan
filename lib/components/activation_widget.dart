import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'activation_model.dart';
export 'activation_model.dart';

class ActivationWidget extends StatefulWidget {
  const ActivationWidget({Key? key}) : super(key: key);

  @override
  _ActivationWidgetState createState() => _ActivationWidgetState();
}

class _ActivationWidgetState extends State<ActivationWidget> {
  late ActivationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ActivationModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: 300.0,
      height: 320.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            color: Color(0x3B1D2429),
            offset: Offset(0.0, -3.0),
          )
        ],
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 150.0,
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional(-0.04, 0.10),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                    child: Container(
                      width: 120.0,
                      height: 120.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF29BF12),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check_box,
                        color: Colors.white,
                        size: 42.0,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.04, -1.47),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(33.0, 33.0, 33.0, 33.0),
                    child: Container(
                      width: 5.0,
                      height: 5.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF29BF12),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.04, -0.95),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(125.0, 25.0, 0.0, 0.0),
                    child: Container(
                      width: 8.0,
                      height: 8.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF29BF12),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.03, -0.27),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(160.0, 40.0, 0.0, 0.0),
                    child: Container(
                      width: 5.0,
                      height: 5.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF29BF12),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(-0.01, 0.43),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(130.0, 60.0, 0.0, 0.0),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF29BF12),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            'Activated Successfully',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Noto Sans',
                  color: Color(0xFF29BF12),
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          Text(
            'Your Qr Code was activated successfully\nactivated. You can use it.',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  fontFamily: 'Noto Sans',
                  color: Color(0xFF636363),
                  fontSize: 12.0,
                ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 25.0, 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                context.pushNamed('homScreen');
              },
              child: Container(
                width: 259.0,
                height: 59.0,
                decoration: BoxDecoration(
                  color: Color(0xFF29BF12),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                  child: Text(
                    'Done',
                    textAlign: TextAlign.center,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Noto Sans',
                          color: FlutterFlowTheme.of(context).primaryBtnText,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
