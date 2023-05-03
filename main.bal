type Person record {
    string id;
    string firstName;
    string lastName;
    int age;
    string country;
};

type Course record {
    string id;
    string name;
    int credits;
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

const D_TIER_4_VISA = "D-tier-4";

var totalCredits = function(int total, record {string id; string name; int credits;} course) returns int => total + (course.id.startsWith("CS") ? course.credits : 0);

function getName() returns string|error {
    return "name";
};

function transform(Person person, Course[] courses) returns Student|error => let var isForeign = person.country != "LK", var myName = "" in {
        id: person.id + (isForeign ? "F" : "") + person.country,
        age: person.age.toString(),
        fullName: person.firstName + " " + person.lastName,
        courses: from var coursesItem in courses
            where coursesItem.id.startsWith("CS")
            select {
                title: coursesItem.id + " " + coursesItem.name,
                credits: coursesItem.credits
            },
        visaType: isForeign ? D_TIER_4_VISA : "n/a",
        totalCredits: (courses).reduce(totalCredits, 0)
    };

function transform2(Person person) returns string => person.id;

function transform3(Person person, Course[] course) returns Student[] => [
    {
        id: person.id,
        fullName: person.lastName,
        age: person.age
    },
    {
        fullName: person.firstName,
        age: person.age,
        visaType: person.country
    }
];

function transform4(Person person) returns Student[]|error => [
    {
        id: person.id + person.country,
        age: person.age,
        fullName: person.firstName
    }
];

function transform5(Person person, Course[] course) returns string[] => [
    person.id,
    person.country,
    ""
];
