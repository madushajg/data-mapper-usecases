import ballerina/time;
import ballerina/http;

type Person record {
    string[] id;
    string firstName;
    string lastName;
    string age;
    string country;
};

type Student record {
    string[] id;
    string fullName;
    string age;
    record {
        string title;
        int credits;
    }[] courses;
    int totalCredits;
    string visaType;
    Student2 std;
};

type Student2 record {
    string[] id;
    string fullName;
    string age;
};

function transform(Person person) returns Student => {
    id: from var idItem in person.id
        select idItem,
    fullName: tnf1(person.firstName, person.lastName),
    visaType: getName(person.age),
    age: tnf2(person.age),
    std: tnf4(person),
    courses: [],
    totalCredits: 0
};

function tnf1(string str1, string str2) returns string => str1 + " " + str2;

function getName(string str) returns string {
    return "Hello " + str;
}

service / on new http:Listener(9090) {
    resource function get greeting() returns string {
        return "Hello, World!";
    }
}
