module app.services.account_service;

// Importe de funções de exceção enforce
import std.exception : enforce;

// Import padrão de entrada e saída IO
import std.stdio;

// Classes User e Account
import app.models.user;
import app.models.account;


// Regra de negócio da conta bancária
class AccountService{

    // Atributos do tipo objetos em arrays
    private Account[] accounts;
    private User[] users;

    // Verifica se há número da conta
    bool existsNumber(string number){
        foreach (acc; accounts){
            if(acc.num == number){
                return true;
            }
        }
        return false;
    }

    // Checa a conta 
    User getMyAccount(string accountNumber){
        enforce(existsNumber(accountNumber), "Account number not found 404");

        foreach (user; users){
            if(user.num == accountNumber){
                return user;
            }
        }
        throw new Exception("Account not found");

    }

    // Cria a conta
    User create_acc(string name, string accountNumber, double initialBalance = 0){
        enforce(!existsNumber(accountNumber), "Account number already exists");
        auto acc = new Account(initialBalance, accountNumber);
        auto user = new User(name, accountNumber, acc);

        accounts ~= acc;
        users ~= user;

        return user;
    }

    // Deposita valor na conta
    void deposit(Account acc, double amount) {
        enforce(acc.num != "", "Invalid account number");
        enforce(amount > 0, "Invalid amount");

        acc.balance += amount;

        writeln("Client: ", acc.num,
                " | Deposit: R$ ", amount,
                " | Balance: R$ ", acc.balance);
    }


    // Saca valor da conta
    void withdraw(Account acc, double amount){
        enforce(acc.num != "", "Invalid account number");
        enforce(amount > 0, "Insufficient");

        acc.balance -= amount;

        writeln("Client: ", acc.num,
                " | WithDraw: R$ ", amount,
                " | Balance: R$ ", acc.balance);
    }


    // Transfere valores de uma conta para outra
    void transfer(Account acc, Account accDest, double amount){
        enforce(acc.num != "", "Invalid account number");
        enforce(accDest.num != "", "Invalid destination account");
        enforce(amount > 0, "Insufficient");
        enforce(acc.balance >= amount, "Invalid account number");
        
        acc.balance -= amount;
        accDest.balance += amount;

        writeln("From: ", acc.num,
                " | To: R$ ", accDest.num,
                " | Transfer: R$ ", amount,
                " | Balance: R$ ", acc.balance);
    }

}