function tnf2(string str2) returns string => "Hello2 " + str2;

function tnf3(string str2) returns string => "Hello2 " + str2;

function tnf4(Person p) returns Student => {
    age: tnf1(p.age, ""),
    id: from var idItem in p.id
        select idItem,
    fullName: p.firstName + p.lastName,
    std: {

        id: [
            p.firstName
        ],
        age: p.country,
        fullName: p.firstName
    }
};
