type NewVehicalA record {
    Model|string model;
};

type NewVehicalB record {
    (Model|string)[] model;
};

type CarA record {
    SUV vehicle;
};

type CarB record {
    SUV|error vehicle;
};

type CarC record {
    SUV[]|HighEndCar vehicle;
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
        year: car.model.engine.length(),
        model: car.category
    }
};

// Type casted union type field
function transformFields11(Vehicle car) returns Car => {
    vehicle: <SUV>{
        model: car.category
    }
};

// Union type field which is missing the value
function transformFields12(Vehicle car) returns Car => {
    vehicle:

};

// Normal field
function transformFields2(Vehicle car) returns CarA => {
    vehicle: {}
};

// Value assgined via link
function transformFields3(Vehicle vehical) returns NewVehicalA => {
    model: vehical.category

};

// Union type consist with error
function transformFields4(Vehicle car) returns CarB => {
    vehicle: {
        model: car.category,
        year: car.year
    }
};

// Union type field containing arrays
function transformFields5(Vehicle car) returns CarC => {

};

// Union type field within query expression
function transformFields6(VehicleA car) returns CarArr => {
    model: from var modelItem in car.model
        select {
            vehicle: <SUV>{
                model: modelItem.engine + modelItem.transmission,
                year: 0
            }
        },
    id: car.category

};

// Union type inside a union type field
function transformFields7(Vehicle car) returns CarInner => {


};

// Union type array element
function transformFields8(Vehicle vehical) returns NewVehicalB => {
    model: [
        <Model>{
            transmission: vehical.category
        }
    ]
};
