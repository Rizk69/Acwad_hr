import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hr/app/app_prefs.dart';
import 'package:hr/app/di.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:meta/meta.dart';
import '../../../../data/network/requests.dart';
import '../../../../domain/model/login/login_model.dart';
import '../../../../domain/usecase/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginUseCase) : super(LoginInitial());
  final AppPreferences _appPreferences = instance<AppPreferences>();

  final LoginUseCase _loginUseCase;
  bool showPassword = true;
  IconData suffixIcon = MdiIcons.eyeOffOutline;
  bool all = false;

  login(LoginRequest loginRequest) async {
    emit(LoginLoading());
    (await _loginUseCase.execute(loginRequest)).fold((failure) {
      emit(LoginFailure(failure.message));
    }, (response) {
      _saveUserDataLocal(response);
      emit(LoginSuccess(response));
    });
  }

  _saveUserDataLocal(LoginModel data) {
    _appPreferences.setUserLoggedIn(true);
    // _appPreferences.setUserToken(data.dataResponse!.token);
    resetModules();
  }

  void updatePassword(String newText) {
    final error = _validateText(newText, 1);
    emit(LoginPasswordValidationState(text: newText, error: error));
  }

  void updateEmail(String newText) {
    final error = _validateText(newText, 0);
    emit(LoginEmailValidationState(text: newText, error: error));
  }

  void isAllValid(String name, String pass) {
    emit(LoginIsAllValidState(
        _validateText(name, 0) == null && _validateText(pass, 1) == null));
  }

  String? _validateText(String text, int type) {
    if (text.isEmpty) {
      if (type == 0 /*name validation*/) {
        return "LocaleKeys.emptyName.tr()";
      } else {
        return "LocaleKeys.emptyPassword.tr()";
      }
    }
    return null;
  }

  void setPasswordIcon() {
    showPassword = !showPassword;
    suffixIcon = showPassword ?  MdiIcons.eyeOffOutline: MdiIcons.eyeOutline;
    emit(ShowPasswordState());
  }
}
