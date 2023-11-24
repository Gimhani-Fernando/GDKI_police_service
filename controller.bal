import ballerina/http;

service / on new http:Listener(8080) {

    isolated resource function get citizens/[int id]() returns Citizen|error? {
        return getCitizen(id);
    }

    isolated resource function get citizens() returns Citizen[]|error? {
        return getAllCitizens();
    }

    isolated resource function get offenses/[int id]() returns Offense[]|error? {
        return getOffensesForCitizen(id);
    }

}

