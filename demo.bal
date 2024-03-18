public type CovidCountry record {|
    readonly string iso_code;
    string country;
    int cases;
    int deaths;
    int active;
|};

type CountrySummary record {
    int totalCountries;
    int maxDeaths;
    float averageCases;
};

function intArrToInt(int[] arr) returns int => from var arrItem in arr
    collect sum(arrItem);

function tnfToSummary(CovidCountry[] entries) returns CountrySummary => {
    totalCountries: from var {country} in entries
        collect count(country),
    maxDeaths: from var {deaths} in entries
        collect max(deaths) ?: 0,
    averageCases: <float>from var {cases} in entries
        collect avg(cases)

};
