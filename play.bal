function play1(CovidEntry ce) returns CovidEntry => {
    active: from var daily_casesItem in ce.daily_cases
        collect count(daily_casesItem),
    recovered: <float>from var daily_casesItem1 in ce.daily_cases
        collect avg(daily_casesItem1),
    daily_cases: ce.daily_cases,
    iso_code: ce.iso_code,
    country: ce.country,
    cases: ce.cases,
    deaths: ce.deaths

};

public type CovidEntryTemp record {|
    readonly string iso_code;
    string country;
    int cases;
    int deaths;
    int recovered;
    int active;
    int[] daily_cases;
    InnerRec inner;
|};

type InnerRec record {|
    string name;
    int age;
|};

function play2(CovidEntryTemp[] entries) returns Summary => {
    totalDeaths: from var {deaths} in entries
        collect avg(deaths)

};

function play2Existing(CovidEntry[] entries) returns Summary => {
    totalDeaths: (from var entriesItem in entries
        select entriesItem.deaths)[0]
};

function play3(CovidEntry[] entries) returns Summary => {
    totalDeaths: from var {recovered, active} in entries
        collect max(recovered) + sum(active),
    recovered: from var {active} in entries
        collect sum(active) ?: 0

};

function play4(int[] arr) returns int => from var arrItem in arr
    collect max(arrItem) ?: 0;

function play5(int?[] arr) returns int => (from var x in arr
    select x ?: 0)[0];

function play6(CovidEntry[] arr) returns CovidEntry => arr;

int? temp = 10;

function play7(CovidEntry[] arr) returns CovidEntry[] => from var arrItem in arr
    select {
        deaths: from var daily_casesItem in arrItem.daily_cases
            collect count(daily_casesItem),
        recovered: 0,
        cases: temp ?: 0,
        iso_code: "",
        country: "",
        active: 0,
        daily_cases: []

    };

// function play8(CovidEntry[] arr) returns CovidEntry => (from var arrItem in arr
//     select {
//         country: arrItem.country,
//         recovered: arrItem.recovered,
//         cases: arrItem.cases,
//         daily_cases: arrItem.daily_cases,
//         active: arrItem.active,
//         iso_code: arrItem.iso_code,
//         deaths: arrItem.deaths
//     })[0];

function play8(CovidPatient[] patient) returns int[] => from var patientItem in patient
    select patientItem.age ?: 0;
