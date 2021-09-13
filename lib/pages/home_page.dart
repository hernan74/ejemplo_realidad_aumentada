import 'package:flutter/material.dart';
import 'package:ar_flutter_plugin/ar_flutter_plugin.dart';
import 'package:ar_flutter_plugin/datatypes/config_planedetection.dart';
import 'package:ar_flutter_plugin/datatypes/hittest_result_types.dart';
import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/models/ar_anchor.dart';
import 'package:ar_flutter_plugin/models/ar_hittest_result.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modelo_base/bloc/realidad_aumentada_bloc.dart';
import 'package:modelo_base/global/environment.dart';
import 'package:modelo_base/providers/ar_view_manager.dart';
import 'package:modelo_base/utils/utilidades.dart';
import 'package:modelo_base/widgets/button_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: BlocBuilder<RealidadAumentadaBloc, RealidadAumentadaState>(
        buildWhen: (previous, current) => (!current.isWorking &&
            current.accion == '${Environment.blocOnInitFirebase}'),
        builder: (context, state) {
          return state.firebaseInitialize
              ? _ArVision()
              : Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        state.error,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: size.height * 0.02),
                      ),
                      ButtonWidget(
                          texto: 'Reintentar',
                          onPressed: () {
                            context
                                .read<RealidadAumentadaBloc>()
                                .add(OnInitFirebaseRealidadAumentada());
                          })
                    ],
                  ),
                );
        },
      )),
    );
  }
}

class _ArVision extends StatefulWidget {
  @override
  __ArStateVision createState() => __ArStateVision();
}

class __ArStateVision extends State<_ArVision> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        ARView(
          onARViewCreated: (arSessionManager, arObjectManager, arAnchorManager,
              arLocationManager) {},
          // ArViewManager().onARViewCreated(arSessionManager, arObjectManager,
          //     arAnchorManager, arLocationManager, context)

          planeDetectionConfig: PlaneDetectionConfig.horizontalAndVertical,
        ),
        Align(
          alignment: FractionalOffset.bottomCenter,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            // ElevatedButton(
            //     onPressed: ArViewManager().onRemoveEverything,
            //     child: Text("Remove Everything")),
          ]),
        ),
        BlocBuilder<RealidadAumentadaBloc, RealidadAumentadaState>(
          builder: (context, state) {
            return Align(
              alignment: FractionalOffset.topCenter,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Visibility(
                        visible: state.listoSubir,
                        child: ElevatedButton(
                            onPressed: () {
                              //  ArViewManager().onUploadButtonPressed
                            },
                            child: Text("Upload"))),
                    Visibility(
                        visible: state.listoBajar,
                        child: ElevatedButton(
                            onPressed: () {
                              // ArViewManager().onDownloadButtonPressed
                            },
                            child: Text("Download"))),
                  ]),
            );
          },
        ),
      ],
    );
  }
}
