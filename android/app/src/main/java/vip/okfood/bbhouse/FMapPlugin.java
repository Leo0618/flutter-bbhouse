package vip.okfood.bbhouse;

import android.annotation.SuppressLint;
import android.app.Activity;


import androidx.annotation.NonNull;
import io.flutter.Log;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.PluginRegistry;

/**
 * function:
 *
 * <p></p>
 * Created by Leo on 2019/9/25.
 */
@SuppressWarnings("WeakerAccess")
public class FMapPlugin implements MethodChannel.MethodCallHandler {
    @SuppressLint("StaticFieldLeak")
    private static Activity mActivity;

    public static void registerWith(PluginRegistry.Registrar registrar) {
        mActivity = registrar.activity();
        final MethodChannel channel = new MethodChannel(registrar.messenger(), "fmap");
        channel.setMethodCallHandler(new FMapPlugin());
    }

    @Override
    public void onMethodCall(@NonNull MethodCall methodCall, @NonNull MethodChannel.Result result) {
        if(BuildConfig.DEBUG) Log.d("FMapPlugin", "methodCall:"+methodCall.method);
        switch(methodCall.method) {
            case "showOldHouseMapShow":
                Double lon = methodCall.argument("lon");
                Double lat = methodCall.argument("lat");
                if(lon == null || lat == null) {
                    result.error("lon and lat can not be null", null, null);
                    return;
                }
                MapshowActivity.launchMe(mActivity, lon, lat);
                break;
            case "hello":
                break;
            default:
                result.notImplemented();
        }
    }
}
