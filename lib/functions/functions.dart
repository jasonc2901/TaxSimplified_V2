import 'package:flutter/material.dart';
import 'package:tax_simplified_new/config/data.dart';
import 'package:tax_simplified_new/models/taxmodel.dart';

Future<TaxModel> calculateSalary(int salary) async {
  FocusManager.instance.primaryFocus?.unfocus();

  if (salary < 1 || !countryList.any((c) => c.isSelected == true)) {
    return TaxModel(
        selectedCountry: null, net: 0, gross: 0, tax: 0, userSalary: 0);
  }

  var model = await calculateTax(salary);

  return model;
}

Future<TaxModel> calculateTax(int salary) async {
  var selectedCountry = countryList.firstWhere((c) => c.isSelected == true);

  for (int i = 0; i < selectedCountry.brackets.length; i++) {
    var bracket = selectedCountry.brackets[i];

    // // this condition will be met when dealing with the highest tax bracket
    if (bracket.range.length == 1) {
      if (salary >= bracket.range[0]) {
        int allowance = salary > 100000 ? 0 : selectedCountry.personalAllowance;
        var taxable = salary - allowance;
        var taxToPay = taxable * bracket.percentage;

        return TaxModel(
          net: salary - taxToPay,
          gross: salary.toDouble(),
          tax: bracket.percentage,
          userSalary: salary,
        );
      }
    }

    // this condition will be met for any other bracket
    if (bracket.range.length > 1) {
      if (salary >= bracket.range[0] && salary <= bracket.range[1]) {
        double netSalary = 0;

        if (salary > selectedCountry.personalAllowance) {
          var taxable = salary - selectedCountry.personalAllowance;
          var taxToPay = taxable * bracket.percentage;
          netSalary = salary - taxToPay;
        } else {
          netSalary = salary.toDouble();
        }

        return TaxModel(
          net: netSalary,
          gross: salary.toDouble(),
          tax: bracket.percentage,
          userSalary: salary,
        );
      }
    }
  }

  return TaxModel(net: 0, gross: 0, tax: 0, userSalary: salary);
}
