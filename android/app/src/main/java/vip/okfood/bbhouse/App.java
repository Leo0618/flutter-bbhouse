package vip.okfood.bbhouse;

import com.baidu.mapapi.CoordType;
import com.baidu.mapapi.SDKInitializer;


import io.flutter.app.FlutterApplication;

/**
 * function:
 *
 * <p></p>
 * Created by Leo on 2019/9/25.
 */
public class App extends FlutterApplication {
    @Override
    public void onCreate() {
        super.onCreate();
        SDKInitializer.initialize(getApplicationContext());
        SDKInitializer.setCoordType(CoordType.BD09LL);
    }
}
