import ballerinax/mysql.driver as _;

isolated function getCitizen(int id) returns Citizen|error {
    panic error("Not implemented");
}
isolated function getCitizenByNIC(string nic) returns Citizen|error {
    panic error("Not implemented");
}

isolated function getAllCitizens() returns Citizen[]|error {
    panic error("Not implemented");
}

isolated function getOffensesForCitizen(int id) returns Offense[]|error? {
    panic error("Not implemented");
}
