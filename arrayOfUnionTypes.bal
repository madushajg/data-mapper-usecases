import ballerina/auth;
import ballerina/email;

// array of union types, type resolved through value expression
function tnfUnionArray1(Vehicle vehical) returns (SUV|HighEndCar)[] => [
    {
        model: vehical.model.transmission,
        year: vehical.year
    }
];

// array of union types, type resolved through value expression
function tnfUnionArray2(Vehicle vehical) returns (SUV|HighEndCar)[] => [
    {
        year: 0,
        model: vehical.model.transmission
    },
    {
        year: vehical.year,
        model: {
            transmission: "",
            engine: ""
        }
    }
];

// array of union types which are arrays, type resolved via casting and via value expression
function tnfUnionArray3(Vehicle vehical) returns (SUV[]|HighEndCar[])[] => [
    <SUV[]>[
        {
            year: 0,
            model: ""
        },
        {}
    ],
    [
        {
            year: 0,
            model: {
                transmission: vehical.model.transmission,
                engine: ""
            }
        }
    ]
];

// array of union types which are arrays, the value is empty
function tnfUnionArray4(Vehicle vehical) returns (SUV[]|HighEndCar[])[] => [
];

// array of union types which are arrays (imported types), type is resolved through value expression
function tnfUnionArray5(Vehicle vehical) returns (email:Message[]|HighEndCar[])[] => [
    [
        {
            subject: "",
            to: ""
        }
    ]
];

// array of union types which consists of array and record type (imported)
function tnfUnionArray6(Vehicle vehical) returns (email:Message|HighEndCar[])[] => [
    {
        subject: "",
        to: ""
    }
];

// array of union types, type resolved via type casting
function tnfUnionArray7(Vehicle vehical) returns (SUV|HighEndCar)[] => [
    <SUV>{
        year: 0
    }
];

// array of union types, type narrowed to single type
function tnfUnionArray8(Vehicle vehical) returns (SUV|error)[] => [
    {}
];

// optional type array, type narrowed to single type
function tnfUnionArray9(Vehicle vehical) returns SUV?[] => [
    {}
];

// array of imported union types, type resolved via value expression
function tnfUnionArray10(Vehicle vehical) returns (email:Options|auth:LdapUserStoreConfig)[] => [
    {
        userEntryObjectClass: "",
        userNameSearchFilter: "",
        groupNameAttribute: "",
        userNameAttribute: "",
        membershipAttribute: "",
        groupNameListFilter: "",
        groupSearchBase: [
            vehical.model.engine
        ],
        userSearchBase: "",
        groupNameSearchFilter: "",
        userNameListFilter: "",
        domainName: "",
        connectionUrl: "",
        groupEntryObjectClass: "",
        connectionName: "",
        connectionPassword: ""
    }
];

// array of imported union types, type resolved via type casting and via value expression
function tnfUnionArray11(Vehicle vehical) returns (email:Options|auth:LdapUserStoreConfig)[] => [
    <auth:LdapUserStoreConfig>{
        userEntryObjectClass: "",
        userNameSearchFilter: "",
        groupNameAttribute: ""
    },
    {}
];

// array of imported union types consist of primitive type
function tnfUnionArray12(Vehicle vehical) returns (int|SUV)[] => [
    0,
    <SUV>{}
];

// regular array typed output
function tnfUnionArray13(Vehicle v) returns SUV[] => [

];
