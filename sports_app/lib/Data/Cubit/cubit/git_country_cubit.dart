import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'git_country_state.dart';

class GitCountryCubit extends Cubit<GitCountryState> {
  GitCountryCubit() : super(GitCountryInitial());
}
