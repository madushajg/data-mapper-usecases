public type CovidEntry record {|
    readonly string iso_code;
    string country;
    int cases;
    int deaths;
    int recovered;
    int active;
    int[] daily_cases;
|};

type CovidPatient record {|
    string name;
    int age;
    TempertureReading[] tempReadings;
|};

type CovidPatientTemp record {|
    string name;
    int age;
    TempertureReading[][] tempReadings;
|};

type TempertureReading record {|
    string date;
    decimal temperature;
|};

type Summary record {
    int totalDeaths;
};
