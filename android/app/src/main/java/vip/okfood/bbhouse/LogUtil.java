package vip.okfood.bbhouse;


/**
 * function : 日志输出.
 *
 * <p>
 * Created by Leo on 2015/12/31.
 */
@SuppressWarnings("ALL")
public final class LogUtil {
    private static       boolean DEBUG       = BuildConfig.DEBUG;
    private static final String  TAG_DEFAULT = "TAG_DEFAULT";

    public static void config(boolean debug) {
        DEBUG = debug;
    }

    public static boolean isLoggable() {
        return DEBUG;
    }

    public static void v(String content) {
        v(TAG_DEFAULT, content);
    }

    public static void v(String tag, String content) {
        if(!isLoggable()) return;
        android.util.Log.v(tag, content == null ? "null" : content);
    }

    public static void w(String content) {
        w(TAG_DEFAULT, content);
    }

    public static void w(String tag, String content) {
        if(!isLoggable()) return;
        android.util.Log.w(tag, content == null ? "null" : content);
    }

    public static void i(String content) {
        i(TAG_DEFAULT, content);
    }

    public static void i(String tag, String content) {
        if(!isLoggable()) return;
        android.util.Log.i(tag, content == null ? "null" : content);
    }

    public static void d(String content) {
        d(TAG_DEFAULT, content);
    }

    public static void d(String tag, String content) {
        if(!isLoggable()) return;
        android.util.Log.d(tag, content == null ? "null" : content);
    }

    public static void e(String content) {
        e(TAG_DEFAULT, content);
    }

    public static void e(String tag, String content) {
        if(!isLoggable()) return;
        android.util.Log.e(tag, content == null ? "null" : content);
    }


}
