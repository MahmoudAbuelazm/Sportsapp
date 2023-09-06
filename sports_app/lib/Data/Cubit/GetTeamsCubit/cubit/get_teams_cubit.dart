import 'package:bloc/bloc.dart';

import 'package:meta/meta.dart';
import 'package:sports_app/Data/Models/get_teams_model.dart';
import 'package:sports_app/Data/Rpository/git_teams_repo.dart';

part 'get_teams_state.dart';

class GetTeamsCubit extends Cubit<GetTeamsState> {
  GetTeamsCubit() : super(GetTeamsInitial());

  GetTeamsRepo TeamsRepo = GetTeamsRepo();

  GetTeams() async {
    emit(GetTeamsLoading());
    try {
      await TeamsRepo.getTeams().then((value) {
        if (value != null) {
          emit(GetTeamsSuccess(response: value));
        } else {
          emit(GetTeamsError());
        }
      });
    } catch (error) {
      emit(GetTeamsError());
    }
  }
}
