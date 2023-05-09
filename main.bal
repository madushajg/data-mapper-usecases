import ballerinax/mysql.driver as _;
import ballerinax/mysql;

import ballerina/io;

type DataBaseConfig record {|
    string host;
    int port;
    string user;
    string password;
    string database;
|};

configurable DataBaseConfig dataBaseConfig = ?;

function initDBClient() returns mysql:Client => new (...dataBaseConfig);

function name() returns xml => ();

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

const D_TIER_4_VISA = "D tier-4";

var totalCredits = function(int total, record {string id; string name; int credits;} course) returns int => total + (course.id.startsWith("CS") ? course.credits : 0);

function transform(Person person, Course[] courses) returns Student => let var isForeign = person.country != "LK" in {
        fullName: person.id,
        totalCredits: person.age,
        visaType: person.country,
        id: person.firstName
    };

function transform2(Person person, Course[] courses) returns Student => let var isForeign = person.country != "LK", var variable = 234 in {
        visaType: D_TIER_4_VISA,
        id: person.id,

        fullName: person.firstName + person.lastName,
        totalCredits: variable,
        age: person.age.toString(),
        courses: from var coursesItem in courses
            select {
                title: coursesItem.id + coursesItem.name,
                credits: coursesItem.credits
            }
    };

function name3() => {};

function name4(string str) => {};

function name5() returns string => {};
