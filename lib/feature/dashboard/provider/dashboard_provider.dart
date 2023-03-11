import 'package:flutter_riverpod/flutter_riverpod.dart';

class DashboardProvider extends StateNotifier<int> {
  DashboardProvider(): super(0);

  void setPosition(int value){
    state=value;
  }
  
}
final dashboardProvider = StateNotifierProvider<DashboardProvider,int>((ref) => DashboardProvider());