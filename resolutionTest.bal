import ballerina/auth;
import ballerina/jwt;
import ballerina/email;

function tnf1(Vehicle vehical) returns SUV|HighEndCar => <SUV>{
    year: vehical.year,
    model: vehical.model.transmission
};

function tnf2(Vehicle vehical) returns SUV|HighEndCar => let var variable1 = "100" in <SUV>{
        year: vehical.year,
        model: variable1 + vehical.category // not working
    };

function tnf3(Vehicle vehical) returns SUV|HighEndCar => {
    year: vehical.year,
    model: {
        transmission: vehical.model.transmission,
        engine: vehical.model.engine
    }
};

function tnf4(Vehicle vehical) returns SUV|HighEndCar => vehical.model;

function tnf5(Vehicle vehical) returns SUV|HighEndCar => <SUV>{
    strA: ""
};

function tnf6(Vehicle vehical) returns SUV|HighEndCar[] => <HighEndCar[]>[
    {
        year: vehical.year,
        model: {
            transmission: "",
            engine: ""
        }
    },
    {}
];

// When the type is derivable
function tnf7(Vehicle vehical) returns SUV|HighEndCar[] => [
    {
        year: vehical.year,
        model: {
            transmission: "",
            engine: ""
        }
    }
];

function tnf8(Vehicle vehical) returns HighEndCar[]|HighEndCar[][] => <HighEndCar[][]>[
    [
        {
            year: ,
            model: {
                transmission: "",
                engine: ""
            }
        }
    ]
];

function tnf9(int x) returns int|float[] => x;

function tnf10(int x, int y) returns int|float[] => x + y; // not working

function tnf11(int x) returns email:Options[]|auth:LdapUserStoreConfig[] => <auth:LdapUserStoreConfig[]>[
    {
        domainName: x
    },
    {}
];

function tnf12(int x) returns email:Options|auth:LdapUserStoreConfig => <email:Options>{};

function tnf13(int x, string y) returns TypeA|TypeB|TypeC|error => {
    strB1: y
};

function tnf14(TypeA typeA) returns TypeA|TypeB|TypeC|error => typeA.tb1;

function tnf15(int x) returns TypeA|TypeB|TypeC|error => {
    strB1: x.toString() // not working
};

function tnf16(Vehicle vehical) returns (SUV|xml)[] => [];

function tnf17(Vehicle vehical) returns xml[] => [];

type TypeAll TypeA|TypeB;

type TypeA record {
    string strA;
    TypeB1 tb1;
};

type TypeB TypeB1|TypeB2;

type TypeB1 record {
    string strB1;
};

type TypeB2 record {
    string strB2;
};

type TypeC record {
    string strC;
};
