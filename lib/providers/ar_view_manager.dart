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

class ArViewManager {
  static final ArViewManager _arViewManager = new ArViewManager._();

  ArViewManager._();
  FirebaseProvider firebaseManager = new FirebaseProvider();

  factory ArViewManager() {
    return _arViewManager;
  }
}
