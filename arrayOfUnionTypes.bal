import ballerina/auth;
import ballerina/email;

function tnf20(Vehicle vehical) returns (SUV|HighEndCar)[] => [
    <SUV>{
        model: vehical.model.transmission,
        year: vehical.year
    }
];

function tnf201(Vehicle vehical) returns (SUV|HighEndCar)[] => [
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

function tnf202(Vehicle vehical) returns (SUV[]|HighEndCar[])[] => [
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

function tnf2021(Vehicle vehical) returns (SUV[]|HighEndCar[])[] => [
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

function tnf203(Vehicle vehical) returns (email:Message[]|HighEndCar[])[] => [
    [
        {
            subject: "",
            to: ""
        }
    ]
];

function tnf204(Vehicle vehical) returns (email:Message|HighEndCar[])[] => [
    {
        subject: "",
        to: ""
    }
];

function tnf21(Vehicle vehical) returns (SUV|HighEndCar)[] => [
    <SUV>{
        year: 0,
        model: vehical.category
    }
];

function tnf211(Vehicle vehical) returns (SUV|error)[] => [
    {
        year: 0
    },
    <SUV>{}
];

function tnf212(Vehicle vehical) returns SUV?[] => [
    {
        year: 0
    },
    <SUV>{
        year: vehical.price
    }
];

function tnf23(Vehicle vehical) returns (email:Options|auth:LdapUserStoreConfig)[] => [
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

function tnf231(Vehicle vehical) returns (email:Options|auth:LdapUserStoreConfig)[] => [
    <auth:LdapUserStoreConfig>{
        userEntryObjectClass: "",
        userNameSearchFilter: "",
        groupNameAttribute: ""
    },
    {}
];

function tnf24(Vehicle vehical) returns (int|SUV)[] => [
    0,
    <SUV>{}
];

function name111(Vehicle v) returns SUV[] => [
    {},
    {},
    {}
];

// ######################### Next #########################
// 1. Improve union type selection on partial elements
