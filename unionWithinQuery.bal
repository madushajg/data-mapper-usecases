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

// Need to show a banner saying the Ballerina support is not there yet
function transform01(T3 t3) returns T4 => {
    t1sOrT2s: from var t1sItem in t3.t1s
        select {
            str: ""
        }
};

function transform02(T3 t3) returns T5 => {
    t1OrT2s: from var t1sItem in t3.t1s
        select {
            str: t1sItem.str
        }
};

function transform021(T3 t3) returns T5 => {};

function transform03(T3 t3) returns T5 => {
    t1OrT2s: from var t1sItem in t3.t1s
        select {
            str:
        }
};

function transform04(T3 t3) returns T51 => {
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

function transform05(T3 t3) returns T5 => {
    t1OrT2s: from var t1sItem in t3.t1s
        select t1sItem.str == "foo" ? {str: t1sItem.str} : {foo: true}
};
