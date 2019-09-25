package vip.okfood.bbhouse;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Color;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.baidu.mapapi.map.BaiduMap;
import com.baidu.mapapi.map.BitmapDescriptorFactory;
import com.baidu.mapapi.map.MapStatusUpdateFactory;
import com.baidu.mapapi.map.MapView;
import com.baidu.mapapi.map.MarkerOptions;
import com.baidu.mapapi.map.OverlayOptions;
import com.baidu.mapapi.map.UiSettings;
import com.baidu.mapapi.model.LatLng;
import com.baidu.mapapi.search.core.PoiInfo;
import com.baidu.mapapi.search.poi.OnGetPoiSearchResultListener;
import com.baidu.mapapi.search.poi.PoiDetailResult;
import com.baidu.mapapi.search.poi.PoiDetailSearchResult;
import com.baidu.mapapi.search.poi.PoiIndoorResult;
import com.baidu.mapapi.search.poi.PoiNearbySearchOption;
import com.baidu.mapapi.search.poi.PoiResult;
import com.baidu.mapapi.search.poi.PoiSearch;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import androidx.annotation.DrawableRes;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

/**
 * function:
 *
 * <p></p>
 * Created by Leo on 2019/9/25.
 */
public class MapshowActivity extends AppCompatActivity {

    public static void launchMe(Activity activity, double lon, double lat) {
        Intent intent = new Intent(activity, MapshowActivity.class);
        intent.putExtra("lon", lon);
        intent.putExtra("lat", lat);
        activity.startActivity(intent);
    }

    private MapView   mMapView;
    private LatLng    mCenterLatLng;
    private PoiSearch mPoiSearch;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_mapshow);
        findViewById(R.id.btnBack).setOnClickListener(v -> finish());
        mMapView = findViewById(R.id.mapView);
        RecyclerView listUI = findViewById(R.id.listUI);

        Intent intent = getIntent();
        if(intent == null) {
            finish();
            return;
        }
        double lon = intent.getDoubleExtra("lon", 0);
        double lat = intent.getDoubleExtra("lat", 0);
        LogUtil.d("MapshowActivity:onCreate=> lon="+lon+", lat="+lat);
        mCenterLatLng = new LatLng(lat, lon);
        mPoiSearch = PoiSearch.newInstance();
        mPoiSearch.setOnGetPoiSearchResultListener(mOnGetPoiSearchResultListener);

        UiSettings uiSettings = mMapView.getMap().getUiSettings();

        mMapView.showScaleControl(false);//比例尺
        uiSettings.setCompassEnabled(false);//指南针
        mMapView.showZoomControls(false);//缩放按钮
        uiSettings.setScrollGesturesEnabled(true);//地图平移
        uiSettings.setZoomGesturesEnabled(true);//地图缩放
        uiSettings.setOverlookingGesturesEnabled(false);//地图俯视（3D）
        uiSettings.setRotateGesturesEnabled(false);//地图旋转

        listUI.setLayoutManager(new LinearLayoutManager(this, RecyclerView.HORIZONTAL, false));
        listUI.setAdapter(new TabsAdapter(mOnSelectedListener));

    }

    private TabsAdapter.OnSelectedListener mOnSelectedListener = new TabsAdapter.OnSelectedListener() {
        @Override
        public void onSelected(int index, TabsAdapter.Tab tab) {
            BaiduMap map = mMapView.getMap();
            map.setMapStatus(MapStatusUpdateFactory.newLatLngZoom(mCenterLatLng, 16.5f));
            map.clear();
            map.addOverlay(centerOverLay());

            currentPoiIndex = index;
            currentPoi = index == 1 ? "公交站" : index == 2 ? "地铁站" : index == 3 ? "学校" : tab.title;

            mPoiSearch.searchNearby(new PoiNearbySearchOption()
                    .location(mCenterLatLng)
                    .radius(1000)
                    .keyword(currentPoi)
                    .pageCapacity(20));
        }
    };

    private static final List<Integer> MARKERS = Arrays.asList(R.drawable.marker_0, R.drawable.marker_1, R.drawable.marker_2,
            R.drawable.marker_3, R.drawable.marker_4, R.drawable.marker_5, R.drawable.marker_6, R.drawable.marker_7, R.drawable.marker_8);

    private int                          currentPoiIndex;
    private String                       currentPoi                    = "";
    private OnGetPoiSearchResultListener mOnGetPoiSearchResultListener = new OnGetPoiSearchResultListener() {
        @Override
        public void onGetPoiResult(PoiResult poiResult) {
            if(poiResult.getTotalPoiNum() <= 0) {
                Toast.makeText(MapshowActivity.this, "附近没有找到"+currentPoi, Toast.LENGTH_SHORT).show();
            } else {
                List<OverlayOptions> options = new ArrayList<>();
                List<PoiInfo>        allPoi  = poiResult.getAllPoi();
                for(PoiInfo info : allPoi) {
                    OverlayOptions option = new MarkerOptions()
                            .position(info.location)
                            .icon(BitmapDescriptorFactory.fromResource(MARKERS.get(currentPoiIndex)));
                    options.add(option);
                }
                mMapView.getMap().addOverlays(options);
            }
        }

        @SuppressWarnings("deprecation")
        @Override
        public void onGetPoiDetailResult(PoiDetailResult poiDetailResult) {
        }

        @Override
        public void onGetPoiDetailResult(PoiDetailSearchResult poiDetailSearchResult) {
        }

        @Override
        public void onGetPoiIndoorResult(PoiIndoorResult poiIndoorResult) {
        }
    };

    private OverlayOptions centerOverLay() {
        return new MarkerOptions()
                .position(mCenterLatLng).clickable(false)
                .icon(BitmapDescriptorFactory.fromResource(R.drawable.ic_marker_location));
    }

    private static class TabsAdapter extends RecyclerView.Adapter<TabsAdapter.ItemViewHolder> {
        private List<Tab>          mDataList = new ArrayList<>();
        private int                currentSelectedIndex;
        private OnSelectedListener mOnSelectedListener;

        TabsAdapter(OnSelectedListener listener) {
            mOnSelectedListener = listener;
            mDataList.add(new Tab("银行", R.drawable.ic_tab_0_n, R.drawable.ic_tab_0_s));
            mDataList.add(new Tab("公交", R.drawable.ic_tab_1_n, R.drawable.ic_tab_1_s));
            mDataList.add(new Tab("地铁", R.drawable.ic_tab_2_n, R.drawable.ic_tab_2_s));
            mDataList.add(new Tab("教育", R.drawable.ic_tab_3_n, R.drawable.ic_tab_3_s));
            mDataList.add(new Tab("医院", R.drawable.ic_tab_4_n, R.drawable.ic_tab_4_s));
            mDataList.add(new Tab("休闲", R.drawable.ic_tab_5_n, R.drawable.ic_tab_5_s));
            mDataList.add(new Tab("购物", R.drawable.ic_tab_6_n, R.drawable.ic_tab_6_s));
            mDataList.add(new Tab("健身", R.drawable.ic_tab_7_n, R.drawable.ic_tab_7_s));
            mDataList.add(new Tab("美食", R.drawable.ic_tab_8_n, R.drawable.ic_tab_8_s));
            currentSelectedIndex = 1;
            mOnSelectedListener.onSelected(currentSelectedIndex, mDataList.get(currentSelectedIndex));
            notifyItemRangeChanged(currentSelectedIndex, 1);
        }

        @NonNull
        @Override
        public ItemViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
            return new ItemViewHolder(LayoutInflater.from(parent.getContext())
                    .inflate(R.layout.item_tab, parent, false));
        }

        @Override
        public void onBindViewHolder(@NonNull ItemViewHolder holder, int position) {
            boolean current = currentSelectedIndex == position;
            Tab     item    = mDataList.get(position);
            holder.icon.setImageResource(current ? item.iconSelected : item.iconNormal);
            holder.title.setText(item.title);
            holder.title.setTextColor(current ? Color.parseColor("#2469F5") : Color.parseColor("#8F8E8E"));
            holder.itemView.setOnClickListener(v -> {
                int lastIndex = currentSelectedIndex;
                currentSelectedIndex = position;
                mOnSelectedListener.onSelected(currentSelectedIndex, item);
                notifyItemRangeChanged(lastIndex, 1);
                notifyItemRangeChanged(currentSelectedIndex, 1);
            });
        }

        @Override
        public int getItemCount() {
            return mDataList.size();
        }

        class ItemViewHolder extends RecyclerView.ViewHolder {
            ImageView icon;
            TextView  title;

            ItemViewHolder(@NonNull View itemView) {
                super(itemView);
                icon = itemView.findViewById(R.id.icon);
                title = itemView.findViewById(R.id.title);
            }
        }

        interface OnSelectedListener {
            void onSelected(int index, Tab tab);
        }

        static class Tab {
            String title;
            @DrawableRes
            int iconNormal;
            @DrawableRes
            int iconSelected;

            Tab(String title, int iconNormal, int iconSelected) {
                this.title = title;
                this.iconNormal = iconNormal;
                this.iconSelected = iconSelected;
            }
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        mMapView.onResume();
    }

    @Override
    protected void onPause() {
        super.onPause();
        mMapView.onPause();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        mMapView.onDestroy();
        if(mPoiSearch != null) mPoiSearch.destroy();
    }
}
