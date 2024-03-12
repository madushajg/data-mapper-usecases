
function string2D2String2D(string[][] patient) returns string[][] => from var patientItem in patient
    select from var patientItemItem in patientItem
        select patientItemItem;

function string3D2String3D(string[][][] patient) returns string[][][] => from var patientItem in patient
    select from var patientItemItem in patientItem
        select from var patientItemItemItem in patientItemItem
            select patientItemItemItem;

function record3D2Record2D(CovidEntry[][][] ce) returns CovidEntry[][][] => from var ceItem in ce
    select from var ceItemItem in ceItem
        select from var ceItemItemItem in ceItemItem
            select {
                iso_code: ceItemItemItem.iso_code,
                country: ,
                cases: ,
                deaths: ,
                recovered: ,
                active: ceItemItemItem.active,
                daily_cases:
            };

function string2D2Record2D(string[][] patient) returns record {string[][] arr;} => {
    arr: from var patientItem in patient
        select from var patientItemItem in patientItem
            select patientItemItem

};

function recordInner2D2RecordInner2D(CovidPatientTemp patient) returns CovidPatientTemp => {
    tempReadings: from var tempReadingsItem in patient.tempReadings
        select from var tempReadingsItemItem in tempReadingsItem
            select {
                date: tempReadingsItemItem.date,
                temperature: tempReadingsItemItem.temperature
            }

};
