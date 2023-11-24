import ballerina/sql;
import ballerinax/mysql;
import ballerinax/mysql.driver as _;

public type Citizen record {|
    int id?;
    string nic;
    string fullname;
    boolean offenses = false;
|};

public type Offense record {|
    int id?;
    string offense;
    int citizen_id;
|};

configurable string USER = ?;
configurable string PASSWORD = ?;
configurable string HOST = ?;
configurable int PORT = ?;
configurable string DATABASE = ?;

final mysql:Client dbClient = check new (
    host = HOST, user = USER, password = PASSWORD, port = PORT, database = DATABASE
);

isolated function addCitizen(Citizen citizen) returns int|error {
    sql:ExecutionResult result = check dbClient->execute(`
        INSERT INTO Citizen (nic,fullname, offenses)
        VALUES ( '${citizen.nic}', '${citizen.fullname}', ${citizen.offenses ? 1 : 0})
    `);
    int|string? lastInsertId = result.lastInsertId;
    if lastInsertId is int {
        return lastInsertId;
    } else {
        return error("Unable to obtain last insert ID");
    }
}

isolated function getCitizen(int id) returns Citizen|error {
    Citizen citizen = check dbClient->queryRow(
        `SELECT * FROM Citizen WHERE id = ${id}`
    );
    return citizen;
}
isolated function getCitizenByNIC(string nic) returns Citizen|error {
    Citizen citizen = check dbClient->queryRow(
        `SELECT * FROM Citizen WHERE nic = '${nic}'`
    );
    return citizen;
}

isolated function getAllCitizens() returns Citizen[]|error {
    Citizen[] citizens = [];
    stream<Citizen, error?> resultStream = dbClient->query(
        `SELECT * FROM Citizen`
    );
    check from Citizen citizen in resultStream
        do {
            citizens.push(citizen);
        };
    check resultStream.close();
    return citizens;
}

isolated function updateCitizen(Citizen citizen) returns int|error {
    sql:ExecutionResult result = check dbClient->execute(`
        UPDATE Citizen SET
        nic = '${citizen.nic}',
        fullname = '${citizen.fullname}',
        offenses = ${citizen.offenses ? 1 : 0}
        WHERE id = ${citizen.id}
    `);
    int|string? lastInsertId = result.lastInsertId;
    if lastInsertId is int {
        return lastInsertId;
    } else {
        return error("Unable to obtain last insert ID");
    }
}

isolated function removeCitizen(int id) returns int|error {
    sql:ExecutionResult result = check dbClient->execute(`
        DELETE FROM Citizen WHERE id = ${id}
    `);
    int? affectedRowCount = result.affectedRowCount;
    if affectedRowCount is int {
        return affectedRowCount;
    } else {
        return error("Unable to obtain the affected row count");
    }
}

isolated function getOffensesForCitizen(int id) returns Offense[]|error? {
    Offense[] offenses = [];
    stream<Offense, error?> resultStream = dbClient->query(
        `SELECT offense FROM Offense WHERE citizen_id = ${id}`
    );
    check from Offense offense in resultStream
        do {
            offenses.push(offense);
        };
    check resultStream.close();
    return offenses;
}
