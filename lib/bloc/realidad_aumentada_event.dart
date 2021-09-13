part of 'realidad_aumentada_bloc.dart';

@immutable
abstract class RealidadAumentadaEvent {}

class OnInitFirebaseRealidadAumentada extends RealidadAumentadaEvent {}

class OnPlaneTapedRealidadAumentada extends RealidadAumentadaEvent {
  final List<ARHitTestResult> hitTestResults;

  OnPlaneTapedRealidadAumentada(this.hitTestResults);
}

class OnListoSubirRealidadAumentada extends RealidadAumentadaEvent {
  final bool listoSubir;

  OnListoSubirRealidadAumentada(this.listoSubir);
}
