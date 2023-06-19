import ballerina/auth;
import ballerina/jwt;
import ballerina/email;

function tnfUnionRoot1(Vehicle vehical) returns SUV|HighEndCar => {
    model: vehical.category,
    year: 2019
};

function tnfUnionRoot2(Vehicle vehical) returns SUV|HighEndCar => <TypeA>{
    model: vehical.category,
    year: 1996
};

function tnfUnionRoot3(Vehicle vehical) returns SUV|HighEndCar => let var var1 = "100" in <SUV>{
        model: var1

    };

function tnfUnionRoot4(Vehicle vehical) returns SUV|HighEndCar => {
    year: vehical.year,
    model: {
        transmission: vehical.model.transmission,
        engine: vehical.model.engine
    }
};

function tnfUnionRoot5(Vehicle vehical) returns SUV|HighEndCar => vehical.model;

function tnfUnionRoot6(Vehicle vehical) returns SUV|HighEndCar => <SUV>vehical.model;

function tnfUnionRoot7(Vehicle vehical) returns SUV|HighEndCar => <SUV>{
    strA: vehical.category
};

function tnfUnionRoot8(Vehicle vehical) returns SUV[]|HighEndCar[] => <SUV[]>[
    {
        year: ,
        model: vehical.model.transmission
    },
    {
        year: vehical.year
    },
    {
        model: vehical.model.engine
    }
];

// When the type is derivable (need to handle adding new elements)
function tnfUnionRoot9(Vehicle vehical) returns SUV|HighEndCar[] => <HighEndCar[]>[
    {
        year: vehical.year,
        model: {
            transmission: "",
            engine: ""
        }
    },
    {}
];

function tnfUnionRoot10(Vehicle vehical) returns HighEndCar[]|HighEndCar[][] => <HighEndCar[][]>[
    [
        {
            year: vehical.year,
            model: {
                transmission: "",
                engine: ""
            }
        },
        {}
    ],
    [
        {
            model: {
                engine: vehical.category
            }
        }
    ]
];

function tnfUnionRoot11(int x) returns int|float[] => x; // Shouldn't replace the default value when deleting

function tnfUnionRoot12(int x) returns int|float[] => [
    x * 1.0,
    0
];

function tnfUnionRoot13(int x, int y) returns int|float[] => let var variable = "a" in x + y; // Need to handle add type cast for binary expressions

function tnfUnionRoot14(int x) returns email:Options[]|auth:LdapUserStoreConfig[] => <auth:LdapUserStoreConfig[]>[
    {
        connectionName: x

    }
];

function tnfUnionRoot15(int x) returns email:Options|auth:LdapUserStoreConfig => <email:Options>{
    sender: x
};

function tnfUnionRoot16(int x, string y) returns TypeA|TypeB|TypeC|error => <TypeB1>{
    strB1: 12
};

function tnfUnionRoot17(int x, string y) returns TypeA|(TypeB|TypeC)[]|TypeB1 => {}; // Need to change the expression body accordingly 

function tnfUnionRoot18(int x, string y) returns TypeA|(TypeB|TypeC)[]|TypeB1 => <(TypeB1|TypeB2|TypeC)[]>[
    {
        strB1: ""
    },
    {
        strC: ""
    },

    <TypeB1>{},
    <TypeB2>{}
];

function tnfUnionRoot19(TypeA typeA) returns TypeA|TypeB|TypeC|error => typeA.tb1;

function tnfUnionRoot20(int x) returns TypeA|TypeB|TypeC|error => {
    strB1: x.toString()
};

function tnfUnionRoot21(Vehicle vehical) returns (SUV|xml)[] => [];

function tnfUnionRoot22(Vehicle vehical) returns xml[]|TypeA[] => [];

function tnfUnionRoot23(TypeA a) returns anydata[] => [];

// ######################### Next #########################
// 1. Add a warning when re-initializing types
