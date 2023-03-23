type Doctor record {
    string docId;
    string[] speciality;
    string contactNumber;
};

type Teacher record {
    string id;
    string[] modules;
};

type Student record {
    string id;
    string[] courses;
};

type Person Doctor|Teacher|Student;

type Request record {
    string id;
    string[] speciality?;
    string[] modules?;
    string[] courses?;
    int age;
    string name;
};

function tnf(Request[] req) returns Person[]|error => let var doctors = req[0], var teachers = req[1], var students = req[2]
    in [
        {
            docId: doctors.id,
            speciality: doctors.speciality ?: [],
            contactNumber: check getContactNumber(doctors.id)
        },
        {
            id: teachers.id,
            modules: teachers.modules ?: []
        },
        {
            id: students.id,
            courses: students.courses ?: []
        }
    ];

function tnf2(Request[] req) returns Person[]|Request[]|error => let var doctors = req[0], var teachers = req[1], var students = req[2]
    in [
        {
            id: doctors.id,
            speciality: [],
            modules: [],
            courses: [],
            age: 0,
            name: ""
        }
    ];

function tnf2222(Person person) returns Person[]|error => [];

function tnfTemp(Request[] r) returns Student[]|error => from var rItem in r
    select {
        id: ,
        courses:
    };

function tnfTemp2(Request[] r) returns Student|Teacher|Doctor => {
    id: "",
    modules: []
};

function getContactNumber(string id) returns string|error {
    if (id == "1") {
        return "1234567890";
    } else if (id == "2") {
        return "0987654321";
    } else {
        return error("Invalid ID");
    }
}
