import ballerina/http;

type Person record {
    string id;
    string firstName;
    string lastName;
    int age;
    string country;
    string visaType;
    float gpa;
    int totalCredits;
    string[] skills;
    string[] languages;
    string email;
    string phone;
    string address;
    string city;
    string state;
    string zip;
    string[] socialLinks;
    string[] workExperience;
    string[] education;
    float salary;
    float tuition;
    string fullName;
    string title;
    int credits;
    boolean isStudent;
    boolean hasWorkExperience;
    boolean hasEducation;
    int[] noOfCourses;
    string[] courseIds;
    string[] courseNames;
};

type Person2 record {
    string id;
    string firstName;
    string lastName;
    int age;
    string country;
    string visaType;
    float gpa;
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
    float gpa;
    string[] skills;
    string[] languages;
    string email;
    string phone;
    string address;
    string city;
    string state;
    string zip;
    string[] socialLinks;
    string[] workExperience;
    string[] education;
    float salary;
    string country;
    float tuition;
    boolean isStudent;
    boolean hasWorkExperience;
    boolean hasEducation;
    int[] noOfCourses;
    string[] courseIds;
    string[] courseNames;
    int[] courseCredits;
    boolean isEnrolled;
    boolean isGraduated;
};

function transform(Person person, Course courses) returns Student => {
    visaType: person.firstName + person.address
    age: courses.id,
    courseNames: from var courseIdsItem in person.courseIds
        select "",
    hasEducation: person.isStudent
};

function transform2(Person person, Course courses) returns Student => {
};

function transform3(Person person, Course[] courses) returns Student[] => [];

function transform4(Person person) returns Student => let var variable = "aa" in {

    };
