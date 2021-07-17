class UserData {
  String? memberID;
  String? fatherName;
  String? memberName;
  String? mobile;
  String? address;
  String? adharCardNo;
  String? panno;
  String? isvalid;

  UserData(
      {this.memberID,
      this.fatherName,
      this.memberName,
      this.mobile,
      this.address,
      this.adharCardNo,
      this.panno,
      this.isvalid});

  UserData.fromJson(Map<String, dynamic> json) {
    memberID = json['MemberID'];
    fatherName = json['FatherName'];
    memberName = json['MemberName'];
    mobile = json['Mobile'];
    address = json['Address'];
    adharCardNo = json['AdharCardNo'];
    panno = json['Panno'];
    isvalid = json['Isvalid'];
  }
/*
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MemberID'] = this.memberID;
    data['FatherName'] = this.fatherName;
    data['MemberName'] = this.memberName;
    data['Mobile'] = this.mobile;
    data['Address'] = this.address;
    data['AdharCardNo'] = this.adharCardNo;
    data['Panno'] = this.panno;
    data['Isvalid'] = this.isvalid;
    return data;
  }*/
}
