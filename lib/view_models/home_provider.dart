import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ebook_app/models/category.dart';
import 'package:flutter_ebook_app/util/api.dart';

class HomeProvider with ChangeNotifier {
  CategoryFeed top = CategoryFeed();
  CategoryFeed recent = CategoryFeed();
  bool loading = true;

  getFeeds() async {
    setLoading(true);
    Api.getCategory(Api.popular).then((popular) {
      setTop(popular);
      Api.getCategory(Api.noteworthy).then((newReleases) {
        setRecent(newReleases);
        setLoading(false);
      }).catchError((e) {
        throw (e);
      });
    }).catchError((e) {
      throw (e);
    });
  }

  void setLoading(value) {
    loading = value;
    notifyListeners();
  }

  void setTop(value) {
    top = value;
    notifyListeners();
  }

  CategoryFeed getTop() {
    return top;
  }

  void setRecent(value) {
    recent = value;
    notifyListeners();
  }

  CategoryFeed getRecent() {
    return recent;
  }
}
