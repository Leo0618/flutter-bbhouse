class HomeModel {
  String searchBarPlaceholder;
  int defaultRecommend;
  ActivitiesBean activities;
  FeelingsBean feelings;
  MarketBean market;
  List<String> sequence;
  List<IconsListBean> icons;
  List<TopicsListBean> topics;

  HomeModel({this.searchBarPlaceholder, this.defaultRecommend, this.activities, this.feelings, this.market, this.icons, this.topics, this.sequence});

  HomeModel.fromJson(Map<String, dynamic> json) {    
    this.searchBarPlaceholder = json['search_bar_placeholder'];
    this.defaultRecommend = json['default_recommend'];
    this.activities = json['activities'] != null ? ActivitiesBean.fromJson(json['activities']) : null;
    this.feelings = json['feelings'] != null ? FeelingsBean.fromJson(json['feelings']) : null;
    this.market = json['market'] != null ? MarketBean.fromJson(json['market']) : null;
    this.icons = (json['icons'] as List)!=null?(json['icons'] as List).map((i) => IconsListBean.fromJson(i)).toList():null;
    this.topics = (json['topics'] as List)!=null?(json['topics'] as List).map((i) => TopicsListBean.fromJson(i)).toList():null;

    List<dynamic> sequenceList = json['sequence'];
    this.sequence = new List();
    this.sequence.addAll(sequenceList.map((o) => o.toString()));
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
    data['icons'] = this.icons != null?this.icons.map((i) => i.toJson()).toList():null;
    data['topics'] = this.topics != null?this.topics.map((i) => i.toJson()).toList():null;
    data['sequence'] = this.sequence;
    return data;
  }

}

class ActivitiesBean {
  String title;
  List<ListListBean> list;

  ActivitiesBean({this.title, this.list});

  ActivitiesBean.fromJson(Map<String, dynamic> json) {    
    this.title = json['title'];
    this.list = (json['list'] as List)!=null?(json['list'] as List).map((i) => ListListBean.fromJson(i)).toList():null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['list'] = this.list != null?this.list.map((i) => i.toJson()).toList():null;
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
    this.list = (json['list'] as List)!=null?(json['list'] as List).map((i) => ListListBean.fromJson(i)).toList():null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['m_url'] = this.mUrl;
    data['more_desc'] = this.moreDesc;
    data['title'] = this.title;
    data['list'] = this.list != null?this.list.map((i) => i.toJson()).toList():null;
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
    this.list = (json['list'] as List)!=null?(json['list'] as List).map((i) => ListListBean.fromJson(i)).toList():null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_key'] = this.itemKey;
    data['title'] = this.title;
    data['list'] = this.list != null?this.list.map((i) => i.toJson()).toList():null;
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
