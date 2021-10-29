import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/repo/lang_reposirory.dart';

import 'lang_event.dart';
import 'lang_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  static const String ARABIC = 'ar';
  static const String ENGLISH = 'en';

  LanguageBloc() : super(LanguageInitial());
  String lang = ENGLISH;

  @override
  Stream<LanguageState> mapEventToState(LanguageEvent event) async* {
    if (event is AppStart) {
      LanguageLoading();
      String result = await LanguageRepository.hasLang();
      lang = result ?? ENGLISH;
      yield LanguagChanged(language: result ?? ENGLISH);
    } else if (event is ChangeLanguage) {
      LanguageLoading();
      lang = event.lang;
      await LanguageRepository.saveLang(lang);
      yield LanguagChanged(language: event.lang);
    }
  }
}
