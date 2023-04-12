import ballerina/auth;
import ballerina/jwt;
import ballerina/email;

function tnf1(Vehicle vehical) returns SUV|HighEndCar => {
    model: vehical.category,
    year: 1990
};

function tnf1_1(Vehicle vehical) returns SUV|HighEndCar => <TypeA>{
    model: vehical.category,
    year: 1996
};

function tnf2(Vehicle vehical) returns SUV|HighEndCar => let var var1 = "100" in <SUV>{
        model: var1

    };

function tnf3(Vehicle vehical) returns SUV|HighEndCar => {
    year: vehical.year,
    model: {
        transmission: vehical.model.transmission,
        engine: vehical.model.engine
    }
};

function tnf4(Vehicle vehical) returns SUV|HighEndCar => vehical.model;

function tnf41(Vehicle vehical) returns SUV|HighEndCar => <SUV>vehical.model;

function tnf5(Vehicle vehical) returns SUV|HighEndCar => <SUV>{
    strA: vehical.category
};

function tnf6(Vehicle vehical) returns SUV[]|HighEndCar[] => <SUV[]>[
    {
        year: ,
        model: vehical.model.transmission
    },
    {
        year: vehical.year
    }
];

// When the type is derivable (need to handle adding new elements)
function tnf7(Vehicle vehical) returns SUV|HighEndCar[] => <HighEndCar[]>[
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
            year: vehical.year,
            model: {
                transmission: "",
                engine: ""
            }
        }
    ]
];

function tnf9(int x) returns int|float[] => x; // Shouldn't replace the default value when deleting

function tnf91(int x) returns int|float[] => [
    x * 1.0,
    0
];

function tnf10(int x, int y) returns int|float[] => let var variable = "a" in x + y; // Need to handle add type cast for binary expressions

function tnf11(int x) returns email:Options[]|auth:LdapUserStoreConfig[] => <auth:LdapUserStoreConfig[]>[
    {
        connectionName: x

    }
];

function tnf12(int x) returns email:Options|auth:LdapUserStoreConfig => <email:Options>{
    sender: x
};

function tnf13(int x, string y) returns TypeA|TypeB|TypeC|error => <TypeB1>{
    strB1: 12
};

function tnf131(int x, string y) returns TypeA|(TypeB|TypeC)[]|TypeB1 => {};

function tnf132(int x, string y) returns TypeA|(TypeB|TypeC)[]|TypeB1 => <(TypeB1|TypeB2|TypeC)[]>[
    {
        strB1: ""
    },
    {
        strC: ""
    },

    <TypeB1>{},
    <TypeB2>{}
];

function tnf14(TypeA typeA) returns TypeA|TypeB|TypeC|error => typeA.tb1;

function tnf15(int x) returns TypeA|TypeB|TypeC|error => {
    strB1: x.toString()
};

function tnf16(Vehicle vehical) returns (SUV|xml)[] => [];

function tnf17(Vehicle vehical) returns xml[]|TypeA[] => [];

function tnf18(TypeA a) returns anydata[] => [];

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

// ######################### Next #########################
// 1. Need to handle union type in array
// 2. Need to handle add type cast for binary expressions
// 3. Need to handle union types in query expressions
// 4. Add dissabled search for cases where search is not applicable
// 5. Add a warning when selecting a type 
// 6. Reduce the gap between search and the top of the page
