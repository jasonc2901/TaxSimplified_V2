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
      TaxBracket(range: [12571, 50270], percentage: 0.20),
      TaxBracket(range: [50271, 125140], percentage: 0.40),
      TaxBracket(range: [125141], percentage: 0.45),
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
      TaxBracket(range: [0, 12570], percentage: 0),
      TaxBracket(range: [12571, 14732], percentage: 0.19),
      TaxBracket(range: [14733, 25688], percentage: 0.20),
      TaxBracket(range: [25689, 43662], percentage: 0.21),
      TaxBracket(range: [43663, 125140], percentage: 0.42),
      TaxBracket(range: [125141], percentage: 0.47),
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
      TaxBracket(range: [12571, 50270], percentage: 0.20),
      TaxBracket(range: [50271, 125140], percentage: 0.40),
      TaxBracket(range: [125141], percentage: 0.45),
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
      TaxBracket(range: [12571, 50270], percentage: 0.20),
      TaxBracket(range: [50271, 125140], percentage: 0.40),
      TaxBracket(range: [125141], percentage: 0.45),
    ],
  )
];
