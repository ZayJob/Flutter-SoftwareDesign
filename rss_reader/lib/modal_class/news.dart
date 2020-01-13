class News {

  String _title, _description, _date, _urlImage, _urlPost;
  int _id;

  News(this._title, this._description, this._date, this._urlImage, this._urlPost);

  News.withId(this._id, this._title, this._description, this._date, this._urlImage, this._urlPost);

  get urlPost => _urlPost;

  set urlPost(value) {
    _urlPost = value;
  }

  get urlImage => _urlImage;

  set urlImage(value) {
    _urlImage = value;
  }

  get date => _date;

  set fecha(value) {
    _date = value;
  }

  get descripcion => _description;

  set description(value) {
    _description = value;
  }

  get title => _title;

  set title(value) {
    _title = value;
  }

  int get id => _id;

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['title'] = _title;
    map['description'] = _description;
    map['urlImage'] = _urlImage;
    map['urlPost'] = _urlPost;
    map['date'] = _date;

    return map;
  }

  News.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._title = map['title'];
    this._description = map['description'];
    this._urlImage = map['urlImage'];
    this._urlPost = map['urlPost'];
    this._date = map['date'];
  }
}