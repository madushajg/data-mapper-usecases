import ballerina/auth;
import ballerina/email;

function tnfUnionArray1(Vehicle vehical) returns (SUV|HighEndCar)[] => [
    <SUV>{
        model: vehical.model.transmission,
        year: vehical.year
    }
];

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

function tnfUnionArray3(Vehicle vehical) returns (SUV[]|HighEndCar[])[] => [
    [
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

function tnfUnionArray4(Vehicle vehical) returns (SUV[]|HighEndCar[])[] => [
    [
        {
            year: ,
            model: ""
        }
    ],
    <HighEndCar[]>[
        {
            model: {
                transmission: vehical.model.engine
            }
        }
    ]
];

function tnfUnionArray5(Vehicle vehical) returns (email:Message[]|HighEndCar[])[] => [
    [
        {
            subject: "",
            to: ""
        }
    ]
];

function tnfUnionArray6(Vehicle vehical) returns (email:Message|HighEndCar[])[] => [
    {
        subject: "",
        to: ""
    }
];

function tnfUnionArray7(Vehicle vehical) returns (SUV|HighEndCar)[] => [
    <SUV>{
        year: 0,
        model: vehical.category
    }
];

function tnfUnionArray8(Vehicle vehical) returns (SUV|error)[] => [
    {
        year: 0
    },
    <SUV>{}
];

function tnfUnionArray9(Vehicle vehical) returns SUV?[] => [
    {
        year: 0
    },
    <SUV>{
        year: vehical.price
    }
];

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

function tnfUnionArray11(Vehicle vehical) returns (email:Options|auth:LdapUserStoreConfig)[] => [
    <auth:LdapUserStoreConfig>{
        userEntryObjectClass: "",
        userNameSearchFilter: "",
        groupNameAttribute: ""
    },
    {}
];

function tnfUnionArray12(Vehicle vehical) returns (int|SUV)[] => [
    0,
    <SUV>{}
];

function tnfUnionArray13(Vehicle v) returns SUV[] => [
    {},
    {},
    {}
];

// ######################### Next #########################
// 1. Improve union type selection on partial elements
