import ballerina/http;

service / on new http:Listener(8080) {

    isolated resource function post citizens(@http:Payload Citizen citizen) returns int|error? {
        return addCitizen(citizen);
    }

    isolated resource function get citizens/[int id]() returns Citizen|error? {
        return getCitizen(id);
    }

    isolated resource function get citizens() returns Citizen[]|error? {
        return getAllCitizens();
    }

    isolated resource function put citizens(@http:Payload Citizen citizen) returns int|error? {
        return updateCitizen(citizen);
    }

    isolated resource function delete citizens/[int id]() returns int|error? {
        return removeCitizen(id);
    }
    isolated resource function get offenses/[int id]() returns Offense[]|error? {
        return getOffensesForCitizen(id);
    }

}

