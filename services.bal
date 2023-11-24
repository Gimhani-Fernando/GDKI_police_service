import ballerinax/mysql.driver as _;
import ballerina/log;

isolated function getCitizen(int id) returns Citizen|error {
   Citizen | error citizen = dbclient->/citizens/[id];
    if citizen is error {
         return citizen;
    } else {
         return citizen;
    }
}
isolated function getCitizenByNIC(string nic) returns Citizen|error {
    panic error("Not implemented");
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

isolated function getOffensesForCitizen(int id) returns Offense[]|error? {
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

function initializeDbClient() returns Client|error {
    return new Client();
}
final Client dbclient = check initializeDbClient();


    // resource function get books() returns Book[]|http:InternalServerError {
    //     Book[]|error books = from var book in booksDb->/books(targetType = Book)
    //         select book;
    //     if books is error {
    //         log:printError("Error while retrieving books from the database", 'error = books);
    //         return http:INTERNAL_SERVER_ERROR;
    //     } else {
    //         return books;
    //     }
    // }

    // resource function get book/[string bookId]() returns Book|http:NotFound|http:InternalServerError {
    //     Book|error book = booksDb->/books/[bookId];
    //     if book is persist:NotFoundError {
    //         return http:NOT_FOUND;
    //     } else if book is error {
    //         log:printError("Error while retrieving book from the database", bookId = bookId, 'error = book);
    //         return http:INTERNAL_SERVER_ERROR;
    //     } else {
    //         return book;
    //     }
    // }


// Create a new `employee` record.
// EmployeeInsert employee = {id: 1, name: "John", age: 30, salary: 3000.0};
// int[]|error employeeId = sClient->/employees.post([employee]);

// // Get the `employee` record with the ID 1.
// Employee|error employee = sClient->/employees/1;

// // Update the `employee` record with the ID 1.
// Employee|error updated = sClient->/employees/1.put({salary: 4000.0});

// // Delete the employee record with the ID 1.
// Employee|error deleted = sClient->/employees/1.delete();

// // Get records of all employees.
// stream<Employee, error?> employees = sClient->/employees;