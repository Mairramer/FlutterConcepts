import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'app_localization_delegate.dart';

// ignore: public_member_api_docs
class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  late Map<String, dynamic>
      _localizationsStrings; // Mudança de String para Dynamic

  Future<bool> load() async {
    var jsonString =
        await rootBundle.loadString('lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap =
        json.decode(jsonString); // Mudança de String para Dynamic

    _localizationsStrings = jsonMap.map((key, value) {
      return MapEntry(key, value); // Remover toString
    });
    return true;
  }

  String translate(String key,
      {required Map<String, String> params, String defaultValue = ''}) {
    var value;
    // Modificação do método para pegar json concatenado com . por nível

    if (key.contains('.')) {
      key.split('.').forEach((element) {
        if (value == null) {
          value = _localizationsStrings[element];
        } else {
          value = value[element];
        }
      });
    }

    // tratamento para caso não venha nada
    if (value == null) {
      return throw ArgumentError(
          'key: $key not found in ${locale.languageCode}.json');
    }

    // parametros para poder concatenar valores com o texto
    params.forEach((chave, valor) {
      value = value.replaceAll('{{$chave}}', valor);
    });

    // caso valor esteja nulo retorna o valor default
    return value ?? defaultValue;
  }

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const AppLocalizationsDelegate delegate = AppLocalizationsDelegate();
}
