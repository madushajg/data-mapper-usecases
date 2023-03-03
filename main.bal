type Person record {
    string id;
    string firstName;
    string lastName;
    int age;
    string[] country;
};

type Student record {
    string id;
    string fullName;
    string age;
    record {
        string title;
        int credits;
    }[] courses;
    int totalCredits;
    string visaType;
};

function transform2(Person person) returns Student => {
    visaType: getVisaType(person.id),
    id: person.firstName,
    courses: from var countryItem in person.country
        select {
            title: ,
            credits:
        },
    age: person.lastName
};

function transform3() returns Student => {};

function transform4(Person person) => {};

function getVisaType(string str) returns string {
    return "";
}
