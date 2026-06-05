// app/models/account.d

module app.models.account;
import std.exception : enforce;


class Account {

    double balance;
    string num;

    this(double balance, string num){
        this.balance = balance;
        this.num = num;
    }

    

}