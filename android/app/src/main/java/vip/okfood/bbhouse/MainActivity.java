package vip.okfood.bbhouse;

import android.os.Bundle;


import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

/**
 * function:
 *
 * <p></p>
 * Created by Leo on 2019/9/25.
 */
public class MainActivity extends FlutterActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        registerWithInnerExtra();
    }

    private void registerWithInnerExtra() {
        FMapPlugin.registerWith(registrarFor("vip.okfood.bbhouse.FMapPlugin"));
    }
}
