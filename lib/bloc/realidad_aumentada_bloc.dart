import 'dart:async';

import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/models/ar_anchor.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:modelo_base/global/Environment.dart';
import 'package:modelo_base/models/available_model.dart';
import 'package:modelo_base/providers/firebase_provider.dart';
import 'package:ar_flutter_plugin/datatypes/hittest_result_types.dart';
import 'package:ar_flutter_plugin/datatypes/node_types.dart';
import 'package:ar_flutter_plugin/managers/ar_anchor_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_location_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_object_manager.dart';
import 'package:ar_flutter_plugin/managers/ar_session_manager.dart';
import 'package:ar_flutter_plugin/models/ar_anchor.dart';
import 'package:ar_flutter_plugin/models/ar_hittest_result.dart';
import 'package:ar_flutter_plugin/models/ar_node.dart';
import 'package:flutter/cupertino.dart';
import 'package:modelo_base/bloc/realidad_aumentada_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modelo_base/providers/firebase_provider.dart';
import 'package:modelo_base/utils/utilidades.dart';
import 'package:vector_math/vector_math_64.dart' as VectorMath;

part 'realidad_aumentada_event.dart';
part 'realidad_aumentada_state.dart';

class RealidadAumentadaBloc
    extends Bloc<RealidadAumentadaEvent, RealidadAumentadaState> {
  RealidadAumentadaBloc() : super(RealidadAumentadaState());
  final FirebaseProvider firebaseProvider = new FirebaseProvider();

  ARSessionManager arSessionManager;
  ARObjectManager arObjectManager;
  ARAnchorManager arAnchorManager;
  ARLocationManager arLocationManager;

  @override
  Stream<RealidadAumentadaState> mapEventToState(
    RealidadAumentadaEvent event,
  ) async* {
    if (event is OnInitFirebaseRealidadAumentada) {
      yield state.copWith(
          isWorking: true, accion: '${Environment.blocOnInitFirebase}');
      final bool firebaseInit = await firebaseProvider.initializeFlutterFire();

      yield state.copWith(
          isWorking: false,
          firebaseInitialize: firebaseInit,
          error:
              firebaseInit ? '' : 'No se pudo iniciar el servicio de firebase',
          accion: '${Environment.blocOnInitFirebase}');
    }
  }

  void onARViewCreated(
      ARSessionManager arSessionManager,
      ARObjectManager arObjectManager,
      ARAnchorManager arAnchorManager,
      ARLocationManager arLocationManager) {
    this.arSessionManager = arSessionManager;
    this.arObjectManager = arObjectManager;
    this.arAnchorManager = arAnchorManager;
    this.arLocationManager = arLocationManager;

    this.arSessionManager.onInitialize(
          showFeaturePoints: false,
          showPlanes: true,
          customPlaneTexturePath: "assets/triangle.png",
          showWorldOrigin: false,
        );
    this.arObjectManager.onInitialize();
    this.arAnchorManager.initGoogleCloudAnchorMode();

    this.arSessionManager.onPlaneOrPointTap = onPlaneOrPointTapped;
    // this.arObjectManager.onNodeTap = onNodeTapped;
    // this.arAnchorManager.onAnchorUploaded = onAnchorUploaded;
    // this.arAnchorManager.onAnchorDownloaded = onAnchorDownloaded;
  }

  Future<void> onPlaneOrPointTapped(
      List<ARHitTestResult> hitTestResults) async {}
}
