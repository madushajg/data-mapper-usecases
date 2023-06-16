type NewVehicalA record {
    Model|string model;
};

type NewVehicalB record {
    (Model|string)[] model;
};

type CarA record {
    SUV vehicle;
};

function transformFields1(Vehicle car) returns Car => {
    vehicle: {
        year: car.model.engine.length(),
        model: car.category
    }
};

function transformFields11(Vehicle car) returns Car => {
    vehicle: <SUV>{
        model: car.category
    }
};

function transformFields12(Vehicle car) returns Car => {
    vehicle:

};

function transformFields121(Vehicle car) returns Car => {
    vehicle: <SUV>{
        year:
    }
};

function transformFields2(Vehicle car) returns CarA => {
    vehicle: {}
};

function transformFields3(Vehicle vehical) returns NewVehicalA => {
    model: vehical.category

};

function transformFields4(Vehicle vehical) returns NewVehicalB => {
    model: [
        <Model>{
            transmission: vehical.category
        }
    ]
};
