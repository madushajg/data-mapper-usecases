
function CovidPatient2CovidPatient(CovidPatient[] patient) returns CovidPatient[] => from var patientItem in patient
    select {
        name: patientItem.name,
        age: patientItem.age,
        tempReadings: from var tempReadingsItem in patientItem.tempReadings
            select {
                date: tempReadingsItem.date,
                temperature: tempReadingsItem.temperature
            }
    };
