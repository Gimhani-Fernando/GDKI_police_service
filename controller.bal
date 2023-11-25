import ballerina/http;

service /police on new http:Listener(8080) {
    isolated resource function get requests/[string nic]() returns PoliceRequest[]|error? {
        Citizen|error citizen = getCitizenByNIC(nic);
        if (citizen is Citizen) {
            return getRequestsForCitizen(citizen.id);
        } else {
            return citizen;
        }
    }

    isolated resource function post requests/[string nic]() returns PoliceRequest|error? {
        Citizen|error citizen = getCitizenByNIC(nic);
        if (citizen is Citizen) {
            PoliceRequest addedrequest = check addRequest(citizen);
            if (check checkOffenseExists(citizen.id)) {
                check updateRequestStatus(addedrequest.id, "Rejected");
                addedrequest.status = "Rejected";
            } else {
                check updateRequestStatus(addedrequest.id, "Cleared");
                addedrequest.status = "Cleared";
            }
            return addedrequest;
        } else {
            return citizen;
        }
    }

}

