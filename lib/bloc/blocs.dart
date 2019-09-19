import 'package:bbhouse/data/HomeModel.dart';
import 'package:bbhouse/data/UserInfoModel.dart';
import 'package:bbhouse/data/data_repo.dart';
import 'package:rxdart/rxdart.dart';

import 'bloc_provider.dart';

/// ApplicationBloc
class ApplicationBloc implements BlocBase {
  BehaviorSubject<dynamic> _appEvent = BehaviorSubject<dynamic>();

  Sink<dynamic> get _appEventSink => _appEvent.sink;

  Stream<dynamic> get appEventStream => _appEvent.stream;

  @override
  void dispose() {
    _appEvent.close();
  }

  void sendAppEvent(dynamic data) {
    _appEventSink.add(data);
  }
}

/// home
class HomeBloc implements BlocBase {
  BehaviorSubject<HomeModel> _homeubject = BehaviorSubject<HomeModel>();

  Sink<HomeModel> get _homeSink => _homeubject.sink;

  Stream<HomeModel> get homeStream => _homeubject.stream;

  void getHomeData() async {
    HomeModel model = await DataRepo.getHomeData();
    if (!_homeubject.isClosed) _homeSink.add(model);
  }

  @override
  void dispose() {
    _homeubject.close();
  }
}

/// MineBloc
class MineBloc extends BlocBase {
  // 用户登录信息
  BehaviorSubject<UserInfoModel> _userInfoSubject = BehaviorSubject<UserInfoModel>();

  Sink<UserInfoModel> get userInfoSink => _userInfoSubject.sink;

  Stream<UserInfoModel> get userInfoStream => _userInfoSubject.stream;

  // dispose
  @override
  void dispose() {
    _userInfoSubject.close();
  }
}
