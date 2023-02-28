part of 'esp_cubit.dart';

@immutable
abstract class EspState {}

class EspInitial extends EspState {}

class EspLoading extends EspState {}

class EspSuccess extends EspState {}

class EspError extends EspState {}

class FinishToggle extends EspState {}

class ChangeTime extends EspState {}

class InitialTime extends EspState {}

class LoadingToggle extends EspState {}



