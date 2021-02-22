class ModelProfile{
  int _id;
  String _name;
  String _birthday;
  String _address;
  String _email;
  String _occupation;
  String _gender;
  String _number;
  String _picture;

  ModelProfile(this._id, this._name, this._birthday, this._address, this._email,
      this._occupation, this._gender, this._number, this._picture);

  String get picture => _picture;

  set picture(String value) {
    _picture = value;
  }

  String get number => _number;

  set number(String value) {
    _number = value;
  }

  String get Gender => _gender;

  set Gender(String value) {
    _gender = value;
  }

  String get occupation => _occupation;

  set occupation(String value) {
    _occupation = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get address => _address;

  set address(String value) {
    _address = value;
  }

  String get birthday => _birthday;

  set birthday(String value) {
    _birthday = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}