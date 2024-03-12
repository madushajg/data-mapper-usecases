function CovidEntries2Summary(CovidEntry[] entries) returns Summary => {
    totalDeaths: from var {deaths} in entries
        collect sum(deaths)
};

function CovidEntries2Summary2(CovidEntry[] entries) returns Summary => {
    totalDeaths: from var entry in entries
        let int deaths = entry.deaths
        where entry.iso_code == "USA"
        collect sum(deaths)
};

function CovidEntries2SummaryPlay1(CovidEntry[] entries) returns Summary => {
    totalDeaths: entries[0].deaths
};
