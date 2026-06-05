// main.d
module main; 

import std.stdio;
import app.services.account_service;
import app.models.user;
import app.models.account;
import std.exception;

// Main project
void main(string[] args){
    
    auto service = new AccountService();

    // try catch (Tentativa de execução das funções)
    try {
        auto user1 = service.create_acc("Samuel", "0001", 950.0);
        auto user2 = service.create_acc("Maria Antônia R. S.", "0002", 0.0);

        service.deposit(user1.acc, 350.0);
        service.transfer(user1.acc, user2.acc, 1300.0);
        service.deposit(user1.acc, 5000.0);
        service.transfer(user1.acc, user2.acc, 3100.0);
        service.withdraw(user1.acc, 120.0);
        service.getMyAccount("0001");
        service.getMyAccount("0002");
        writeln(user1);
        writeln(user2);
        

    }catch(Exception e){
        writeln("Error create new account: ", e.msg);
    }

    
}

