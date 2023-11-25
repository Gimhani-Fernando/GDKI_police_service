import ballerina/log;
import ballerina/uuid;
import ballerinax/mysql.driver as _;
import ballerina/time;

isolated function getCitizen(string id) returns Citizen|error {
    Citizen|error citizen = dbclient->/citizens/[id];
    if citizen is error {
        return citizen;
    } else {
        return citizen;
    }
}

isolated function getCitizenByNIC(string nic) returns Citizen|error {
    Citizen[]|error citizens = from var citizen in dbclient->/citizens(targetType = Citizen)
        where citizen.nic == nic
        select citizen;
    if citizens is Citizen[] {
        return citizens[0];
    } else {
        return citizens;
    }
}

isolated function getAllCitizens() returns Citizen[]|error {
    Citizen[]|error citizens = from var citizen in dbclient->/citizens(targetType = Citizen)
        select citizen;
    if citizens is error {
        log:printError("Error while retrieving citizens from the database", 'error = citizens);
        return citizens;
    } else {
        return citizens;
    }
}

isolated function getOffensesForCitizen(string id) returns Offense[]|error? {
    Offense[]|error? offenses = from var offense in dbclient->/offenses(targetType = Offense)
        where offense.citizenId == id
        select offense;
    if offenses is error {
        log:printError("Error while retrieving offenses from the database", 'error = offenses);
        return offenses;
    } else {
        return offenses;
    }
}

isolated function checkOffenseExists(string id) returns boolean|error {
    Offense[] offenses =  check getOffensesForCitizen(id) ?: [];
    if (offenses.length() > 0) {
        return true;
    } else {
        return false;
    }

}
    

isolated function addRequest(Citizen citizen) returns PoliceRequest|error {

    time:Date tnow = time:utcToCivil((time:utcNow()));
    PoliceRequest request = {id: uuid:createType4AsString(), citizenId: citizen.id, status: "PENDING", appliedTime: tnow, reason: ""};
    string[]|error added = dbclient->/policerequests.post([request]);
    if added is error {
        return added;
    } else {
        return request;
    }
}

isolated function getRequest(string id) returns PoliceRequest|error {
    PoliceRequest|error request = dbclient->/policerequests/[id];
    if request is error {
        return request;
    } else {
        return request;
    }
}

isolated function getRequestsForCitizen(string id) returns PoliceRequest[]|error? {
    PoliceRequest[]|error? requests = from var request in dbclient->/policerequests(targetType = PoliceRequest)
        where request.citizenId == id
        select request;
    if requests is error {
        log:printError("Error while retrieving requests from the database", 'error = requests);
        return requests;
    } else {
        return requests;
    }
}

isolated function updateRequestStatus(string id, string status) returns ()|error {
    PoliceRequest|error updated = dbclient->/policerequests/[id].put({status: status});
    if updated is error {
        return updated;
    } else {
        return ();
    }
}

function initializeDbClient() returns Client|error {
    return new Client();
}

final Client dbclient = check initializeDbClient();
