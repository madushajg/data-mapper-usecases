function transformAtFnBody1(T3 t3) returns T1[]|T2[] => <T1[]>from var t1sItem in t3.t1s
    select {
        str: ""
    };

function transformAtFnBody11(T3 t3) returns T4 => {
    t1sOrT2s: from var t1sItem in t3.t1s
        select {
            str: ""
        }
};

function transformAtFnBody12(T3 t3) returns T1[]|T2[] => t3.t1s;

function transformAtFnBody2(T3 t3) returns (T1|T2)[] => from var t1sItem in t3.t1s
    select {
        str: t1sItem.str
    };

function transformAtFnBody21(T3 t3) returns (T1|T2)[] => from var t1sItem in t3.t1s
    select <T1>{
        str: t1sItem.str
    };

function transformAtFnBody3(Vehicle[] vehical) returns (SUV|HighEndCar)[] => from var item in vehical
    select {
        year: item.year,
        model: item.model
    };

function transformAtFnBody4(Vehicle[] vehical) returns (SUV|HighEndCar)[] => [
    {
        year: 0,
        model: ""
    }
];
