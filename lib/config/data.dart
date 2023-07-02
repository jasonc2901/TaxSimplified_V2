import '../models/country.dart';
import '../models/taxbracket.dart';

int latestUKTaxThreshold = 12570;
int nationalInsuranceUpperLimit = 50270;
double latesUKNationalInsurance = 0.1325;
double higherUKNationalInsurance = 0.0325;

//list of available countries and associated tax brackets
List<Country> countryList = [
  Country(
    name: 'England',
    imgUrl: 'assets/england.png',
    isSelected: false,
    personalAllowance: latestUKTaxThreshold,
    nationalInsurancePercentage: latesUKNationalInsurance,
    nationalInsuranceUpperLimit: nationalInsuranceUpperLimit,
    nationalInsuranceHigherPercentage: higherUKNationalInsurance,
    brackets: [
      TaxBracket(range: [0, 12570], percentage: 0),
      TaxBracket(range: [12571, 37700], percentage: 0.20),
      TaxBracket(range: [37701, 150000], percentage: 0.40),
      TaxBracket(range: [150001], percentage: 0.45),
    ],
  ),
  Country(
    name: 'Scotland',
    imgUrl: 'assets/scotland.png',
    isSelected: false,
    personalAllowance: latestUKTaxThreshold,
    nationalInsurancePercentage: latesUKNationalInsurance,
    nationalInsuranceUpperLimit: nationalInsuranceUpperLimit,
    nationalInsuranceHigherPercentage: higherUKNationalInsurance,
    brackets: [
      TaxBracket(range: [0, 2163], percentage: 0.19),
      TaxBracket(range: [2164, 13118], percentage: 0.20),
      TaxBracket(range: [13119, 31092], percentage: 0.21),
      TaxBracket(range: [31093, 150000], percentage: 0.41),
      TaxBracket(range: [150001], percentage: 0.46),
    ],
  ),
  Country(
    name: 'N. Ireland',
    imgUrl: 'assets/NI.png',
    isSelected: false,
    personalAllowance: latestUKTaxThreshold,
    nationalInsurancePercentage: latesUKNationalInsurance,
    nationalInsuranceUpperLimit: nationalInsuranceUpperLimit,
    nationalInsuranceHigherPercentage: higherUKNationalInsurance,
    brackets: [
      TaxBracket(range: [0, 12570], percentage: 0),
      TaxBracket(range: [12571, 37700], percentage: 0.20),
      TaxBracket(range: [37701, 150000], percentage: 0.40),
      TaxBracket(range: [150001], percentage: 0.45),
    ],
  ),
  Country(
    name: 'Wales',
    imgUrl: 'assets/wales.png',
    isSelected: false,
    personalAllowance: latestUKTaxThreshold,
    nationalInsurancePercentage: latesUKNationalInsurance,
    nationalInsuranceHigherPercentage: higherUKNationalInsurance,
    nationalInsuranceUpperLimit: nationalInsuranceUpperLimit,
    brackets: [
      TaxBracket(range: [0, 12570], percentage: 0),
      TaxBracket(range: [12571, 37700], percentage: 0.20),
      TaxBracket(range: [37701, 150000], percentage: 0.40),
      TaxBracket(range: [150001], percentage: 0.45),
    ],
  )
];
