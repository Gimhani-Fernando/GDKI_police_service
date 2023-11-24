import ballerina/persist as _;
import ballerina/time;

public type Citizen record {|
    readonly int id;
    string nic;
    string fullname;
    boolean isCriminal;
    Offense[] offenses;
    PoliceRequest[] requests;
|};

public type Offense record {|
    readonly int id;
    string offense;
    Citizen citizen;
|};

public type PoliceRequest record {|
    readonly int id;
    Citizen citizen;
    string status;
    time:Date appliedTime;
|};





