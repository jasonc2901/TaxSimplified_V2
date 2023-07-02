import 'package:flutter/material.dart';

import '../config/colours.dart';
import '../config/data.dart';

class CountrySelect extends StatefulWidget {
  const CountrySelect({super.key});

  @override
  State<CountrySelect> createState() => _CountrySelectState();
}

class _CountrySelectState extends State<CountrySelect> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...countryList
            .map(
              (country) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      //set all previous countries to not selected
                      for (int i = 0; i < countryList.length; i++) {
                        countryList[i].isSelected = false;
                      }
                      //set the current country to selected
                      country.isSelected = true;
                    });
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color: const Color(0xff7c94b6),
                          image: DecorationImage(
                            image: AssetImage(country.imgUrl),
                            fit: BoxFit.cover,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(50.0)),
                          border: country.isSelected
                              ? Border.all(
                                  color: darkPurple,
                                  width: 4.0,
                                )
                              : null,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25.0),
                          ),
                          color: country.isSelected ? darkPurple : Colors.white,
                        ),
                        child: Text(
                          country.name,
                          style: TextStyle(
                            color:
                                country.isSelected ? Colors.white : greyColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
            .toList()
      ],
    );
  }
}
