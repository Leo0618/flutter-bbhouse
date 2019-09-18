class HomeModel {
  String searchBarPlaceholder;
  int defaultRecommend;
  ActivitiesBean activities;
  FeelingsBean feelings;
  MarketBean market;
  List<CateTabListBean> cateTab;
  List<IconsListBean> icons;
  List<TopicsListBean> topics;

  HomeModel({this.searchBarPlaceholder, this.defaultRecommend, this.activities, this.feelings, this.market, this.cateTab, this.icons, this.topics});

  HomeModel.fromJson(Map<String, dynamic> json) {
    this.searchBarPlaceholder = json['search_bar_placeholder'];
    this.defaultRecommend = json['default_recommend'];
    this.activities = json['activities'] != null ? ActivitiesBean.fromJson(json['activities']) : null;
    this.feelings = json['feelings'] != null ? FeelingsBean.fromJson(json['feelings']) : null;
    this.market = json['market'] != null ? MarketBean.fromJson(json['market']) : null;
    this.cateTab = (json['cateTab'] as List) != null ? (json['cateTab'] as List).map((i) => CateTabListBean.fromJson(i)).toList() : null;
    this.icons = (json['icons'] as List) != null ? (json['icons'] as List).map((i) => IconsListBean.fromJson(i)).toList() : null;
    this.topics = (json['topics'] as List) != null ? (json['topics'] as List).map((i) => TopicsListBean.fromJson(i)).toList() : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['search_bar_placeholder'] = this.searchBarPlaceholder;
    data['default_recommend'] = this.defaultRecommend;
    if (this.activities != null) {
      data['activities'] = this.activities.toJson();
    }
    if (this.feelings != null) {
      data['feelings'] = this.feelings.toJson();
    }
    if (this.market != null) {
      data['market'] = this.market.toJson();
    }
    data['cateTab'] = this.cateTab != null ? this.cateTab.map((i) => i.toJson()).toList() : null;
    data['icons'] = this.icons != null ? this.icons.map((i) => i.toJson()).toList() : null;
    data['topics'] = this.topics != null ? this.topics.map((i) => i.toJson()).toList() : null;
    return data;
  }
}

class ActivitiesBean {
  String title;
  List<ListListBean> list;

  ActivitiesBean({this.title, this.list});

  ActivitiesBean.fromJson(Map<String, dynamic> json) {
    this.title = json['title'];
    this.list = (json['list'] as List) != null ? (json['list'] as List).map((i) => ListListBean.fromJson(i)).toList() : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['list'] = this.list != null ? this.list.map((i) => i.toJson()).toList() : null;
    return data;
  }
}

class FeelingsBean {
  String imgUrl;
  String slogan;

  FeelingsBean({this.imgUrl, this.slogan});

  FeelingsBean.fromJson(Map<String, dynamic> json) {
    this.imgUrl = json['img_url'];
    this.slogan = json['slogan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img_url'] = this.imgUrl;
    data['slogan'] = this.slogan;
    return data;
  }
}

class MarketBean {
  String mUrl;
  String moreDesc;
  String title;
  List<ListListBean> list;

  MarketBean({this.mUrl, this.moreDesc, this.title, this.list});

  MarketBean.fromJson(Map<String, dynamic> json) {
    this.mUrl = json['m_url'];
    this.moreDesc = json['more_desc'];
    this.title = json['title'];
    this.list = (json['list'] as List) != null ? (json['list'] as List).map((i) => ListListBean.fromJson(i)).toList() : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['m_url'] = this.mUrl;
    data['more_desc'] = this.moreDesc;
    data['title'] = this.title;
    data['list'] = this.list != null ? this.list.map((i) => i.toJson()).toList() : null;
    return data;
  }
}

class CateTabListBean {
  String title;
  List<TabListListBean> tabList;

  CateTabListBean({this.title, this.tabList});

  CateTabListBean.fromJson(Map<String, dynamic> json) {
    this.title = json['title'];
    this.tabList = (json['tabList'] as List) != null ? (json['tabList'] as List).map((i) => TabListListBean.fromJson(i)).toList() : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['tabList'] = this.tabList != null ? this.tabList.map((i) => i.toJson()).toList() : null;
    return data;
  }
}

class IconsListBean {
  String actionUrl;
  String id;
  String imgUrl;
  String itemKey;
  String title;

  IconsListBean({this.actionUrl, this.id, this.imgUrl, this.itemKey, this.title});

  IconsListBean.fromJson(Map<String, dynamic> json) {
    this.actionUrl = json['action_url'];
    this.id = json['id'];
    this.imgUrl = json['img_url'];
    this.itemKey = json['item_key'];
    this.title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action_url'] = this.actionUrl;
    data['id'] = this.id;
    data['img_url'] = this.imgUrl;
    data['item_key'] = this.itemKey;
    data['title'] = this.title;
    return data;
  }
}

class TopicsListBean {
  String itemKey;
  String title;
  List<ListListBean> list;

  TopicsListBean({this.itemKey, this.title, this.list});

  TopicsListBean.fromJson(Map<String, dynamic> json) {
    this.itemKey = json['item_key'];
    this.title = json['title'];
    this.list = (json['list'] as List) != null ? (json['list'] as List).map((i) => ListListBean.fromJson(i)).toList() : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_key'] = this.itemKey;
    data['title'] = this.title;
    data['list'] = this.list != null ? this.list.map((i) => i.toJson()).toList() : null;
    return data;
  }
}

class ListListBean {
  String actionUrl;
  String id;
  String imgUrl;
  String itemKey;
  String subtitle;
  String tag;
  String title;

  ListListBean({this.actionUrl, this.id, this.imgUrl, this.itemKey, this.subtitle, this.tag, this.title});

  ListListBean.fromJson(Map<String, dynamic> json) {
    this.actionUrl = json['action_url'];
    this.id = json['id'];
    this.imgUrl = json['img_url'];
    this.itemKey = json['item_key'];
    this.subtitle = json['subtitle'];
    this.tag = json['tag'];
    this.title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action_url'] = this.actionUrl;
    data['id'] = this.id;
    data['img_url'] = this.imgUrl;
    data['item_key'] = this.itemKey;
    data['subtitle'] = this.subtitle;
    data['tag'] = this.tag;
    data['title'] = this.title;
    return data;
  }
}

class TabListListBean {
  String txt1;
  String txt2;
  String txt3;
  String url;

  TabListListBean({this.txt1, this.txt2, this.txt3, this.url});

  TabListListBean.fromJson(Map<String, dynamic> json) {
    this.txt1 = json['txt1'];
    this.txt2 = json['txt2'];
    this.txt3 = json['txt3'];
    this.url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['txt1'] = this.txt1;
    data['txt2'] = this.txt2;
    data['txt3'] = this.txt3;
    data['url'] = this.url;
    return data;
  }
}
