function tnfUnionQueryAtFnBody1(T3 t3) returns T1[]|T2[] => <T1[]>from var t1sItem in t3.t1s
    select {
        str: ""
    };

function tnfUnionQueryAtFnBody2(T3 t3) returns T4 => {
    t1sOrT2s: from var t1sItem in t3.t1s
        select {
            str: ""
        }
};

function tnfUnionQueryAtFnBody3(T3 t3) returns T1[]|T2[] => t3.t1s;

function tnfUnionQueryAtFnBody4(T3 t3) returns (T1|T2)[] => from var t1sItem in t3.t1s
    select {
        str: t1sItem.str
    };

function tnfUnionQueryAtFnBody5(T3 t3) returns (T1|T2)[] => from var t1sItem in t3.t1s
    select <T1>{
        str: t1sItem.str
    };

function tnfUnionQueryAtFnBody6(Vehicle[] vehical) returns (SUV|HighEndCar)[] => from var item in vehical
    select {
        year: item.year,
        model: item.model
    };

function tnfUnionQueryAtFnBody7(Vehicle[] vehical) returns (SUV|HighEndCar)[] => [
    {
        year: 0,
        model: ""
    }
];
