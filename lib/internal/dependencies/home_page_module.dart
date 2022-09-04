
import 'package:proj_clean_arch/domain/state/home_state.dart';
import 'package:proj_clean_arch/internal/dependencies/repository_module.dart';

class HomePageModule{
  static HomePageState  homePageState(){
    return HomePageState(RepositoryModule.dayRepository());
  }
}