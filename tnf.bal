type Type1 record {
    Type2|string unionVal;
    (Type2|string)[] unionArr;
    Type2[]|string[] unionArr2;
    Type2[] type2Arr;
    string str1;
};

type Type2 record {
    string name2;
    string value2;
};

type UnionType1 Type1|Type2|string;

type InputType record {
    string[] str1;
    string str2;
    string str3;
    decimal dec1;
};

function transformUnionReturn(InputType input) returns UnionType1 => let var variableStr = "", var variableInt = 1 in {
        name2: ,
        value2:
    };

function transformUnionArrayField(InputType input) returns UnionType1[] => [
    {
        unionVal: ,
        unionArr: ,
        str1: input.str1
    },
    input.str3
];

function tnf99(InputType inputType) returns Type1 => {
    type2Arr: from var str1Item in inputType.str1
        select {
            name2: ,
            value2:
        },
    unionArr: from var str1Item in inputType.str1
        select ,
    unionArr2: from var str1Item in inputType.str1
        select ""
};

function tnf888(InputType InputType) returns Type2|string => {
    name2: ,
    value2:
};

function transformUnionInlineReturn(InputType input) returns UnionType1|int => {
    unionVal: ,
    unionArr: ,
    str1: ,
    type2Arr: from var str1Item in input.str1
        select {
            name2: "",
            value2: ""
        }
};

function transformUnionPrim(InputType input) returns UnionType1|decimal => input.dec1;

function transformUnionArrReturn(InputType input) returns UnionType1[]|error => [];

function transformUnionReturnRec(InputType input) returns Type1|Type2|UnionType1[] => [];

function transformUnionReturnArray(InputType input) returns (UnionType1|string?)[] => [];

function transformPrimitiveArray(InputType input) returns string[] => [
    input.str1
];

function tnf99Temp(InputType inputType) returns Type1 => {
    type2Arr: from var str1Item in inputType.str1
        select {
            name2: ,
            value2:
        },
    unionArr: from var str1Item in inputType.str1
        select ,
    unionArr2: from var str1Item in inputType.str1
        select ""
};
