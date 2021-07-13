// schema of personal infomation

final String tableNotes = 'info'; // table name

class InfoFields {
  static final List<String> values = [
    accno,
    name,
    father,
    dob,
    address,
    mob,
    adhaar,
    pan
  ];

  static final String accno = "_accno";
  static final String name = "name";
  static final String father = "father";
  static final String dob = "dob";
  static final String address = "address";
  static final String mob = "mob";
  static final String adhaar = "adhaar";
  static final String pan = "pan";
}

class Info {
  final int? accno;
  final String name;
  final String father;
  final String dob;
  final String address;
  final int mob;
  final int adhaar;
  final String pan;

  const Info({
    this.accno,
    required this.name,
    required this.father,
    required this.dob,
    required this.address,
    required this.mob,
    required this.adhaar,
    required this.pan,
  });
  Info copy({
    int? accno,
    String? name,
    String? father,
    String? dob,
    String? address,
    int? mob,
    int? adhaar,
    String? pan,
  }) =>
      Info(
          name: name ?? this.name,
          father: father ?? this.father,
          dob: dob ?? this.dob,
          address: address ?? this.address,
          mob: mob ?? this.mob,
          adhaar: adhaar ?? this.adhaar,
          pan: pan ?? this.pan);

  static Info fromJson(Map<String, Object?> json) => Info(
        accno: json[InfoFields.accno] as int?,
        name: json[InfoFields.name] as String,
        father: json[InfoFields.father] as String,
        dob: json[InfoFields.dob] as String,
        address: json[InfoFields.address] as String,
        mob: json[InfoFields.mob] as int,
        adhaar: json[InfoFields.adhaar] as int,
        pan: json[InfoFields.pan] as String,
      );

  Map<String, Object?> toJson() {
    return {
      InfoFields.accno: accno,
      InfoFields.name: name,
      InfoFields.father: father,
      InfoFields.dob: dob,
      InfoFields.address: address,
      InfoFields.mob: mob,
      InfoFields.adhaar: adhaar,
      InfoFields.pan: pan,
    };
  }
}
