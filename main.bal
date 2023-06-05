type Student record {
    string id;
    int age;
    Course[] courses;
};

type Person record {
    // string id;
    // string firstName;
    // string lastName;
    // string age;
    // string country;
    Course[] modules;
};

type Course record {
    string name;
    string description;
};

function transform(Student student, Course[] courses) returns Person => {
    modules: from var coursesItem in courses.enumerate()
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
    modules: from var item in courses
        select {
            name: "",
            description: ""
        }
};

function getCourses() returns Course[] => [];

Course[] courses = [];

function transform22(Student student, Course[][] courses) returns Person => {
    modules: from var coursesItem in ""
        select {
            name: "",
            description: ""
        }
};

// type Title record {|
//     string \-lang;
//     string \#text;
// |};

// type BookWithStructuredTitle record {|
//     string \-category;
//     Title title;
//     (string|string[]) author;
//     string year;
//     string price;
//     string \-cover?;
// |};

// type InputWithStructuredTitle record {|
//     BookWithStructuredTitle[] books;
// |};

// type Properties record {|
//     Title title;
//     (string|string[]) author;
//     int year;
// |};

// type TransformedBookWithProperties record {|
//     string category;
//     float price;
//     int id;
//     Properties properties;
// |};

// type OutputWithProperties record {|
//     TransformedBookWithProperties[] items;
// |};

// function mapDataWithDefaultsViaRecords(InputWithStructuredTitle input) returns OutputWithProperties|error => 
//     let BookWithStructuredTitle[] books = input.books in 
//     {
//         items: from var entry in books.enumerate() 
//                     select {
//                         category: "book",
//                         price: check float:fromString(entry[1].price),
//                         id: entry[0],
//                         properties: {
//                             title: entry[1].title,
//                             author: entry[1].author,
//                             year: check int:fromString(entry[1].year)
//                         }
//                     }
//     };
    