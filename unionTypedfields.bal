// Union type field, the type is resolved via the value expr
function tnfUnionField1(Vehicle car) returns Car => {
    vehicle: {
        model: car.category,
        year: car.year
    }
};

// Type casted union type field
function tnfUnionField2(Vehicle car) returns Car => {
    vehicle: <SUV>{
        model: car.category,
        year: car.model.engine.length()
    }
};

// Union type field which is missing the value
function tnfUnionField3(Vehicle car) returns Car => {
    vehicle:

};

// Normal field
function tnfUnionField4(Vehicle car) returns CarA => {
    vehicle: {
        model: car.category,
        year: car.year
    }

};

// Value assgined via link
function tnfUnionField5(Vehicle vehical) returns NewVehical => {
    model: <string>vehical.category

};

// Union type consist with error
function tnfUnionField6(Vehicle car) returns CarB => {
    vehicle: {}
};

// Union type field containing arrays
function tnfUnionField7(Vehicle car) returns CarC => {
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
function tnfUnionField8(VehicleA car) returns CarArr => {
};

// Union type inside a union type field
function tnfUnionField9(Vehicle car) returns CarInner => {
    vehicle: <ModelA>{
        vehicleA: <HighEndCar>{
            model: car.model,
            year: car.year
        }
    }

};

// Union type field inside a root union type
function tnfUnionField10(Vehicle car) returns Car|CarA => {

};

// Array of union type field
function tnfUnionField11(Vehicle car) returns CarD => {
    vehicle: [
        <HighEndCar>{}
    ]

};
