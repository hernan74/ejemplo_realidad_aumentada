part of 'realidad_aumentada_bloc.dart';

@immutable
class RealidadAumentadaState {
  final bool firebaseInitialize;
  final String error;
  final String accion;
  final bool isWorking;
  final bool listoSubir;
  final bool listoBajar;
  final AvailableModel modeloSeleccionado;

  //ArCorePlugin
  final bool readyToDownload;
  final bool readyToUpload;
  final List<ARNode> nodes;
  final List<ARAnchor> anchors;
  final String lastUploadedAnchor;
  final Map<String, Map> anchorsInDownloadProgress;

  RealidadAumentadaState({
    this.firebaseInitialize = false,
    this.error = '',
    this.accion = '',
    this.isWorking = false,
    this.listoBajar = false,
    this.listoSubir = false,
    AvailableModel modeloSeleccionado,
    this.readyToDownload = false,
    this.readyToUpload = false,
    List<ARNode> nodes,
    List<ARAnchor> anchors,
    this.lastUploadedAnchor = '',
    Map<String, Map> anchorsInDownloadProgress,
  })  : modeloSeleccionado = modeloSeleccionado ?? new AvailableModel(),
        nodes = nodes ?? [],
        anchors = anchors ?? [],
        anchorsInDownloadProgress = anchorsInDownloadProgress ?? {};

  RealidadAumentadaState copWith({
    final bool firebaseInitialize,
    final String error,
    final String accion,
    final bool isWorking,
    final bool listoSubir,
    final bool listoBajar,
    final AvailableModel modeloSeleccionado,
//ArCorePlugi,
    final bool readyToDownload,
    final bool readyToUpload,
    final List<ARNode> nodes,
    final List<ARAnchor> anchors,
    final String lastUploadedAnchor,
    final Map<String, Map> anchorsInDownloadProgress,
  }) =>
      RealidadAumentadaState(
        firebaseInitialize: firebaseInitialize ?? this.firebaseInitialize,
        error: error ?? this.error,
        accion: accion ?? this.accion,
        isWorking: isWorking ?? this.isWorking,
        listoSubir: listoSubir ?? this.listoSubir,
        listoBajar: listoBajar ?? this.listoBajar,
        modeloSeleccionado: modeloSeleccionado ?? this.modeloSeleccionado,
        readyToDownload: readyToDownload ?? this.readyToDownload,
        readyToUpload: readyToUpload ?? this.readyToUpload,
        nodes: nodes ?? this.nodes,
        anchors: anchors ?? this.anchors,
        lastUploadedAnchor: lastUploadedAnchor ?? this.lastUploadedAnchor,
        anchorsInDownloadProgress:
            anchorsInDownloadProgress ?? this.anchorsInDownloadProgress,
      );
}
