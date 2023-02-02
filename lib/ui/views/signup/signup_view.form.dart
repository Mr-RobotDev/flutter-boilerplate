// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String UsernameValueKey = 'username';
const String EmailValueKey = 'email';
const String PasswordValueKey = 'password';

final Map<String, TextEditingController> _SignupViewTextEditingControllers = {};

final Map<String, FocusNode> _SignupViewFocusNodes = {};

final Map<String, String? Function(String?)?> _SignupViewTextValidations = {
  UsernameValueKey: null,
  EmailValueKey: null,
  PasswordValueKey: null,
};

mixin $SignupView on StatelessWidget {
  TextEditingController get usernameController =>
      _getFormTextEditingController(UsernameValueKey);
  TextEditingController get emailController =>
      _getFormTextEditingController(EmailValueKey);
  TextEditingController get passwordController =>
      _getFormTextEditingController(PasswordValueKey);
  FocusNode get usernameFocusNode => _getFormFocusNode(UsernameValueKey);
  FocusNode get emailFocusNode => _getFormFocusNode(EmailValueKey);
  FocusNode get passwordFocusNode => _getFormFocusNode(PasswordValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_SignupViewTextEditingControllers.containsKey(key)) {
      return _SignupViewTextEditingControllers[key]!;
    }
    _SignupViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _SignupViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_SignupViewFocusNodes.containsKey(key)) {
      return _SignupViewFocusNodes[key]!;
    }
    _SignupViewFocusNodes[key] = FocusNode();
    return _SignupViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    usernameController.addListener(() => _updateFormData(model));
    emailController.addListener(() => _updateFormData(model));
    passwordController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated('Use syncFormWithViewModel instead.'
      'This feature was deprecated after 3.1.0.')
  void listenToFormUpdated(FormViewModel model) {
    usernameController.addListener(() => _updateFormData(model));
    emailController.addListener(() => _updateFormData(model));
    passwordController.addListener(() => _updateFormData(model));
  }

  final bool _autoTextFieldValidation = true;
  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          UsernameValueKey: usernameController.text,
          EmailValueKey: emailController.text,
          PasswordValueKey: passwordController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the FormViewModel
  void _updateValidationData(FormViewModel model) =>
      model.setValidationMessages({
        UsernameValueKey: _getValidationMessage(UsernameValueKey),
        EmailValueKey: _getValidationMessage(EmailValueKey),
        PasswordValueKey: _getValidationMessage(PasswordValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _SignupViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_SignupViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _SignupViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _SignupViewFocusNodes.values) {
      focusNode.dispose();
    }

    _SignupViewTextEditingControllers.clear();
    _SignupViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get usernameValue => this.formValueMap[UsernameValueKey] as String?;
  String? get emailValue => this.formValueMap[EmailValueKey] as String?;
  String? get passwordValue => this.formValueMap[PasswordValueKey] as String?;

  bool get hasUsername =>
      this.formValueMap.containsKey(UsernameValueKey) &&
      (usernameValue?.isNotEmpty ?? false);
  bool get hasEmail =>
      this.formValueMap.containsKey(EmailValueKey) &&
      (emailValue?.isNotEmpty ?? false);
  bool get hasPassword =>
      this.formValueMap.containsKey(PasswordValueKey) &&
      (passwordValue?.isNotEmpty ?? false);

  bool get hasUsernameValidationMessage =>
      this.fieldsValidationMessages[UsernameValueKey]?.isNotEmpty ?? false;
  bool get hasEmailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey]?.isNotEmpty ?? false;
  bool get hasPasswordValidationMessage =>
      this.fieldsValidationMessages[PasswordValueKey]?.isNotEmpty ?? false;

  String? get usernameValidationMessage =>
      this.fieldsValidationMessages[UsernameValueKey];
  String? get emailValidationMessage =>
      this.fieldsValidationMessages[EmailValueKey];
  String? get passwordValidationMessage =>
      this.fieldsValidationMessages[PasswordValueKey];
}

extension Methods on FormViewModel {
  setUsernameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[UsernameValueKey] = validationMessage;
  setEmailValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[EmailValueKey] = validationMessage;
  setPasswordValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PasswordValueKey] = validationMessage;
}
