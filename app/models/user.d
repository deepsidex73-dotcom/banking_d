// app/models/user.d
module app.models.user;

// Importar a classe Account
import app.models.account;

// toString do Dlang
import std.conv : to;

// Classe User
class User {

    // Atributos 
    string name;
    string num;
    Account acc;

    // Construtor
    this(string name, string num, Account acc){
        this.name = name;
        this.num = num;
        this.acc = acc;
    }

    // toString
    override string toString() { 
        return "====== Account =======" ~
            "\nName: " ~ name ~
           "\nAccount: " ~ num ~
           "\nBalance: R$ " ~ to!string(acc.balance);
    }

}