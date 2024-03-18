import ballerina/io;

public function main() {

    CovidEntry[] entries = [
        {iso_code: "AFG", country: "Afghanistan", cases: 10, deaths: 0, recovered: 2, active: 10, daily_cases: [1, 2, 3, 4, 5]},
        {iso_code: "LK", country: "Sri Lanka", cases: 20, deaths: 0, recovered: 20, active: 0, daily_cases: [1, 2, 3, 4, 5]},
        {iso_code: "US", country: "United States", cases: 30, deaths: 20, recovered: 21, active: 0, daily_cases: [1, 2, 3, 4, 5]},
        {iso_code: "AUS", country: "Australia", cases: 40, deaths: 10, recovered: 14, active: 20, daily_cases: [1, 2, 3, 4, 5]}
    ];

    // CovidPatient[] patient = [
    //     {name: "John", age: 20, tempReadings: [{temperature: 98.6, date: "2021-01-01T10:00:00Z"}, {temperature: 99.6, date: "2021-01-01T11:00:00Z"}]},
    //     {name: "Alex", age: 30, tempReadings: [{temperature: 98.6, date: "2021-01-01T10:00:00Z"}, {temperature: 99.6, date: "2021-01-01T11:00:00Z"}]},
    //     {name: "Bob", age: 40, tempReadings: [{temperature: 98.6, date: "2021-01-01T10:00:00Z"}, {temperature: 99.6, date: "2021-01-01T11:00:00Z"}]}
    // ];

    // Summary summary = CovidEntries2Summary(entries);

    Summary summary = play4(entries);
    io:println("Summary: ", summary);

}
