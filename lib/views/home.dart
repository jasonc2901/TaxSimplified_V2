import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:tax_simplified_new/config/colours.dart';
import 'package:tax_simplified_new/widgets/country_select.dart';
import 'package:tax_simplified_new/widgets/salary_calculator.dart';

import '../ui/rounded_button.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var salaryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: darkPurple,
        body: SalaryCalaculatorContainer(
          backgroundColor: Colors.white,
          widgetHeight: screenSize.height * 0.65,
          childWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenSize.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.settings),
                    color: darkPurple,
                    iconSize: 35,
                    onPressed: () {
                      // setState(() {
                      //   showSettings();
                      // });
                    },
                  ),
                ],
              ),
              const Center(
                child: Text(
                  "Salary Information",
                  style: TextStyle(
                    color: darkPurple,
                    fontWeight: FontWeight.w400,
                    fontSize: 32.0,
                  ),
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.02,
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Country",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: darkPurple,
                    fontWeight: FontWeight.w400,
                    fontSize: 28.0,
                  ),
                ),
              ),
              const CountrySelect(),
              SizedBox(
                height: screenSize.height * 0.02,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
                child: Text(
                  "Salary per year (GBP)",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: darkPurple,
                    fontWeight: FontWeight.w400,
                    fontSize: 28.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                child: SizedBox(
                  width: screenSize.width * 0.45,
                  child: TextField(
                      style: const TextStyle(
                        color: greyColor,
                        fontSize: 32.0,
                        fontWeight: FontWeight.w600,
                      ),
                      controller: salaryController,
                      cursorColor: darkPurple,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: greyColor),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: greyColor),
                        ),
                      ),
                      inputFormatters: [
                        CurrencyTextInputFormatter(
                          symbol: "£",
                          decimalDigits: 0,
                          locale: "en",
                        )
                      ],
                      keyboardType:
                          TextInputType.number // Only numbers can be entered
                      ),
                ),
              ),
              const Spacer(),
              RoundedButton(
                onPressed: () => {},
                text: 'Caculate',
                color: orangeColor,
                padding: screenSize.height * 0.05,
              ),
              Container(),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
