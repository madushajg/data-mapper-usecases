function CovidEntries2SummaryWithFilter(CovidEntry[] entries) returns Summary => {
    totalDeaths: (from var entry in entries
        where entry.iso_code == "USA"
        select entry.deaths)[0]
};

function simpleA2STnf(int[] arr) returns int => (from var i in arr select i)[0];
