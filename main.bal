
// ############### Case 1 #####################

import ballerinax/health.fhir.r4.aubase410;
import ballerinax/health.fhir.r4;

public type Patient record {
    string[] fullName;
    string pid;
};

function tranform(Patient[][] p) returns aubase410:AUBasePatient => {

};

// ############### Case 2 #####################
public type Extension2 int|string;

public type AUBasePatient2 record {|
    Extension2[] extension?;
    Extension2[] modifierExtension?;
|};

function tranform2(string s) returns AUBasePatient2 => {

};

// ############### Case 3 #####################
public type Doctor record {
    string name;
    string[] id;
};

public type AUBasePatient3 record {|
    Doctor extension?;
    Doctor modifierExtension?;
|};

function tranform3(string s) returns AUBasePatient3 => {

};

// ############### Case 4 ##################### 

public type Extension string|RecB;

type RecA record {
    Extension[] extension?;
    RecB recB?;
};

type RecB record {
    Extension[] extension?;
};

function tranform4(string[][] s) returns RecA => {

};
