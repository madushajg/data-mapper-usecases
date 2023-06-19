type Vehicle record {
    string category;
    Model model;
    decimal price;
    int year;
};

type Car record {
    SUV|HighEndCar vehicle;
};

type SUV record {|
    string model;
    int year;
|};

type HighEndCar record {
    Model model;
    int year;
};

type Model record {
    string transmission;
    string engine;
};

type NewVehical record {
    Model|string model;
};

type CarA record {
    SUV vehicle;
};

type CarB record {
    SUV|error vehicle;
};

type CarC record {
    SUV[]|HighEndCar[] vehicle;
};

type CarD record {
    (SUV|HighEndCar)[] vehicle;
};

type VehicleA record {
    string category;
    Model[] model;
};

type CarArr record {
    string id;
    ModelA[] model;
};

type CarInner record {
    string|ModelA vehicle;
};

type ModelA record {
    SUV|HighEndCar vehicleA;
};

type T1 record {
    string str;
};

type T11 record {
    string str;
    record {
        string name;
        int age;
        record {
            string parentName;
            int parentAge;
        } parent;
    } person;
};

type T2 record {
    boolean foo;
};

type T3 record {
    T1[] t1s;
};

type T4 record {
    T1[]|T2[] t1sOrT2s;
};

type T5 record {
    (T1|T2)[] t1OrT2s;
};

type T51 record {
    (T11|T2)[] t11sOrT2s;
};

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

function tnfOther1(Vehicle vehical) returns SUV[]|HighEndCar => <HighEndCar>{
    year: 0,
    model: {
        transmission: "",
        engine: ""
    }
};

function tnfOther2(Vehicle vehical) returns SUV[]|HighEndCar[] => <HighEndCar[]>[
    {
        year: 0,
        model: {
            transmission: "",
            engine: ""
        }
    },
    {}
];

function tnfOther3(decimal d) returns float|int => <int>d;

function tnfOther4(Vehicle vehical) returns HighEndCar => {
    year: vehical.year,
    model: {
        transmission: vehical.model.transmission,
        engine: ""
    }
};

function tnfOther5(Vehicle vehical) returns HighEndCar[] => <HighEndCar[]>[
    {
        year: vehical.model.transmission.length(),
        model: {
            transmission: "",
            engine: vehical.model.engine
        }
    },
    {}
];

function tnfOther6(Vehicle vehical) returns SUV|HighEndCar => <SUV>{
    strA: vehical.category
}; // strA is unavailable field, need to indicate this in the diagram

function tnfOther7(int x, int y) returns int|float[] => let var variable = "a" in x + y; // Need to handle add type cast for binary expressions

function tnfOther8(int x, string y) returns TypeA|(TypeB|TypeC)[]|TypeB1 => {}; // Need to change the expression body accordingly 

function tnfOther9(TypeA a) returns anydata[] => []; // Need to handle anydata[]


// ######################### Next #########################
// 1. Add a warning when re-initializing types

