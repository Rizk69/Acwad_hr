import 'dart:async';

import 'package:hr/presentation/common/state_rendrer/state_renderer_impl.dart';

abstract class BaseViewModel extends BaseViewModelInputs
    with BaseViewModelOutputs {
  // shared variables and functions that will be used through any view model
  final StreamController _inputStreamController =
      StreamController<FlowState>.broadcast();

  @override
  Sink get inputState => _inputStreamController.sink;

  @override
  Stream<FlowState> get outputState =>
      _inputStreamController.stream.map((flowState) => flowState);

  @override
  void dispose() {
    _inputStreamController.close();
  }
}

abstract class BaseViewModelInputs {
  void start();

  void dispose();

  Sink get inputState;
}

abstract class BaseViewModelOutputs {
  Stream<FlowState> get outputState;
}
