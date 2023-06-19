function tnfUnionQuery1(T3 t3) returns T4 => {
    t1sOrT2s: from var t1sItem in t3.t1s
        select {
            str: ""
        }
};

function tnfUnionQuery2(T3 t3) returns T5 => {
    t1OrT2s: from var t1sItem in t3.t1s
        select {
            str: t1sItem.str
        }
};

function tnfUnionQuery3(T3 t3) returns T5 => {};

function tnfUnionQuery4(T3 t3) returns T5 => {
    t1OrT2s: from var t1sItem in t3.t1s
        select {
            str:
        }
};

function tnfUnionQuery5(T3 t3) returns T51 => {
    t11sOrT2s: from var t1sItem in t3.t1s
        select {
            str: "",
            person: {
                name: t1sItem.str,
                age: 10,
                parent: {
                    parentName: t1sItem.str,
                    parentAge: 100
                }
            }
        }
};

function tnfUnionQuery6(T3 t3) returns T5 => {
    t1OrT2s: from var t1sItem in t3.t1s
        select t1sItem.str == "foo" ? {str: t1sItem.str} : {foo: true}
};
