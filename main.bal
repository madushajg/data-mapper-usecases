type Student record {
    string id;
    int age;
    Course[] courses;
};

type Person record {
    Course[] modules;
};

type Course record {
    string name;
    string description;
};

Course[] coursesList = [];

function transform(Student student, Course[] courses) returns Person => {
    modules: from var coursesItem in courses.enumerate()
        let var variable = coursesItem[0]
        select {
            name: coursesItem[1].name,
            description: ""
        }

};

function transform2(Student student, Course[] courses) returns Person => {
    modules: from var item in courses
        select {
            name: "",
            description: ""
        }
};

function transform3(Student student, Course[] courses) returns Person => {
    modules: from var item in student.courses.filter(x => x.name == "test").enumerate()
        select {
            name: "",
            description: ""
        }
};

function transform4(Student student) returns Person => {
    modules: from var item in getCourses()
        select {
            name: "",
            description: ""
        }
};

function transform5(Student student) returns Person => {
    modules: from var item in [1, 2, 3]
        select {
            name: "",
            description: ""
        }
};

function transform6(Course[][] courses) returns Person => {
    modules: from var item in courses[0]
        select {
            name: "",
            description: ""
        }
};

function getCourses() returns Course[] => [];
