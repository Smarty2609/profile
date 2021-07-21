class Loans {
  String? loanType;
  String? loanDate;
  int? amount;
  int? balance;
  int? prArr;
  int? interest;
  int? penalInterest;
  int? chequeBounceCR;
  int? postalChargesCR;
  int? arbcost;
  int? intRate;
  int? loanNo;

  Loans(
      {this.loanType,
      this.loanDate,
      this.amount,
      this.balance,
      this.prArr,
      this.interest,
      this.penalInterest,
      this.chequeBounceCR,
      this.postalChargesCR,
      this.arbcost,
      this.intRate,
      this.loanNo});

  Loans.fromJson(Map<String, dynamic> json) {
    loanType = json['LoanType'];
    loanDate = json['LoanDate'];
    amount = json['Amount'];
    balance = json['Balance'];
    prArr = json['PrArr'];
    interest = json['Interest'];
    penalInterest = json['PenalInterest'];
    chequeBounceCR = json['ChequeBounceCR'];
    postalChargesCR = json['PostalChargesCR'];
    arbcost = json['Arbcost'];
    intRate = json['IntRate'];
    loanNo = json['LoanNo'];
  }
/*
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['LoanType'] = this.loanType;
    data['LoanDate'] = this.loanDate;
    data['Amount'] = this.amount;
    data['Balance'] = this.balance;
    data['PrArr'] = this.prArr;
    data['Interest'] = this.interest;
    data['PenalInterest'] = this.penalInterest;
    data['ChequeBounceCR'] = this.chequeBounceCR;
    data['PostalChargesCR'] = this.postalChargesCR;
    data['Arbcost'] = this.arbcost;
    data['IntRate'] = this.intRate;
    data['LoanNo'] = this.loanNo;
    return data;
  }*/
}
