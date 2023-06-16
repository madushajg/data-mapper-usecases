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

function transform1(Vehicle vehical) returns SUV[]|HighEndCar => <HighEndCar>{
    year: 0,
    model: {
        transmission: "",
        engine: ""
    }
};

function transform2(Vehicle vehical) returns SUV[]|HighEndCar[] => <HighEndCar[]>[
    {
        year: 0,
        model: {
            transmission: "",
            engine: ""
        }
    }
];

function transform3(decimal d) returns float|int => <int>d;

function transform1Simplified(Vehicle vehical) returns HighEndCar => {
    year: vehical.year,
    model: {
        transmission: vehical.model.transmission,
        engine: ""
    }
};

function transform2Simplified(Vehicle vehical) returns HighEndCar[] => <HighEndCar[]>[
    {
        year: vehical.model.transmission.length(),
        model: {
            transmission: "",
            engine: vehical.model.engine
        }
    }
];
