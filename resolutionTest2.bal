import ballerina/auth;
import ballerina/email;

function tnf20(Vehicle vehical) returns (SUV|HighEndCar)[] => [
    {
        year: vehical.year,
        model: {
            transmission: "",
            engine: ""
        }
    },
    {}
];

function tnf201(Vehicle vehical) returns (SUV|HighEndCar)[] => [
    {
        year: 0,
        model: vehical.model.engine
    },
    <HighEndCar>{
        year: vehical.year,
        model: {
            transmission: "",
            engine:
        }
    },
    <SUV>{},
    <SUV>{},
    <HighEndCar>{}
];

function tnf2011(Vehicle vehical) returns (SUV|HighEndCar)[] => [
    <SUV>{
        year: vehical.year,
        model: vehical.model.transmission
    },
    <HighEndCar>{
        model: {
            transmission: vehical.model.engine
        }
    }
];

function tnf202(Vehicle vehical) returns (SUV[]|HighEndCar[])[] => [
    [
        {
            year: 0,
            model: ""
        }
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

function tnf21Temp(Vehicle vehical) returns SUV[] => [
    {
        year: 0,
        model:
    }
];

function tnf21(Vehicle vehical) returns (SUV|HighEndCar)[] => [
    <SUV>{
        year: 0,
        model:
    }
];

function tnf211(Vehicle vehical) returns (SUV|error)[] => [
    {
        year: 0
    }
];

function tnf212(Vehicle vehical) returns SUV?[] => [
    {
        year: 0
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
        groupSearchBase: [],
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
    {}
];

function name111(Vehicle v) returns HighEndCar => {

};




// ######################### Next #########################
// 1. Enable creating links by clicking on the fields
// 2. Enable creating links by using the statement editor
// 3. Investigate on the multiple rerendering issue
// 4. Improve union type selection on partial elements