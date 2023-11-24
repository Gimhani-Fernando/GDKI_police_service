import ballerinax/mysql.driver as _;




isolated function addCitizen(Citizen citizen) returns int|error {
    panic error("Not implemented");
}

isolated function getCitizen(int id) returns Citizen|error {
    panic error("Not implemented");
}
isolated function getCitizenByNIC(string nic) returns Citizen|error {
    panic error("Not implemented");
}

isolated function getAllCitizens() returns Citizen[]|error {
    panic error("Not implemented");
}

isolated function updateCitizen(Citizen citizen) returns int|error {
    panic error("Not implemented");
}

isolated function removeCitizen(int id) returns int|error {
    panic error("Not implemented");
}

isolated function getOffensesForCitizen(int id) returns Offense[]|error? {
    panic error("Not implemented");
}
