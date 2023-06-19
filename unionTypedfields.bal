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

// Union type field, the type is resolved via the value expr
function transformFields1(Vehicle car) returns Car => {
    vehicle: {
        model: car.category,
        year: car.year
    }
};

// Type casted union type field
function transformFields11(Vehicle car) returns Car => {
    vehicle: <SUV>{
        model: car.category,
        year: car.model.engine.length()
    }
};

// Union type field which is missing the value
function transformFields12(Vehicle car) returns Car => {
    vehicle:

};

// Normal field
function transformFields2(Vehicle car) returns CarA => {
    vehicle: {
        model: car.category,
        year: car.year
    }

};

// Value assgined via link
function transformFields3(Vehicle vehical) returns NewVehical => {
    model: <string>vehical.category

};

// Union type consist with error
function transformFields4(Vehicle car) returns CarB => {
    vehicle: {}
};

// Union type field containing arrays
function transformFields5(Vehicle car) returns CarC => {
    vehicle: <HighEndCar[]>[
        {
            model: car.model
        },
        {
            model: {
                engine: car.category + car.model.engine
            }
        }
    ]

};

// Union type field within query expression
function transformFields6(VehicleA car) returns CarArr => {
};

// Union type inside a union type field
function transformFields7(Vehicle car) returns CarInner => {
    vehicle: <ModelA>{
        vehicleA: <HighEndCar>{
            model: car.model,
            year: car.year
        }
    }

};

// Union type field inside a root union type
function transformFields8(Vehicle car) returns Car|CarA => {

};

// Array of union type field
function transformFields9(Vehicle car) returns CarD => {
    vehicle: [
        <HighEndCar>{}
    ]

};
