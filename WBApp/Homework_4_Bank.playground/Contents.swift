import UIKit

struct Account {
    let name: String
    let number: String
    var balance: Double
    var password: Int
    var operationsHistory: [String] = []
    
    init(name: String, number: String, balance: Double, password: Int) {
        self.name = name
        self.number = number
        self.balance = balance
        self.password = password
    }
}

final class TBank {
    enum OperationType {
        case add
        case get
    }
    
    private var accounts: [Account] = []
    
    // создание нового счета
    func createAccount(accountInfo: Account) {
        if checkForCreation(account: accountInfo) {
            var newAccount = accountInfo
            newAccount.operationsHistory.append("Создан новый счет \(newAccount.name). Баланс: \(newAccount.balance)")
            self.accounts.append(newAccount)
            print("Счет был успешно создан.\nНазвание счета: \(newAccount.name)\nБаланс: \(newAccount.balance)")
            print("--------------------------------")
        } else {
            print("Счет с таким названием был уже создан!")
            print("--------------------------------")
        }
        
    }
    
    // метод пополнения денег на счет или снятия
    func moneyOperation(account: Account, amount: Double, type: OperationType) {
        guard amount >= 0 else {
            print("Сумма не может быть меньше 0!")
            return
        }
        print("ДО: ")
        checkAccountInfo(name: account.name, password: account.password)
        if let index = accounts.firstIndex(where: { $0.number == account.number && $0.password == account.password }) {
            switch type {
            case .add:
                accounts[index].balance += amount
                let operation = "Баланс пополнен на \(amount). Новый баланс: \(accounts[index].balance)"
                accounts[index].operationsHistory.append(operation)
                print("Пополнение счета прошло успешно на сумму: \(amount)")
                print("--------------------------------")
            case .get:
                if accounts[index].balance >= amount {
                    accounts[index].balance -= amount
                    let operation = "Со счета была снята сумма \(amount). Новый баланс: \(accounts[index].balance)"
                    accounts[index].operationsHistory.append(operation)
                    print("Снятие со счета прошло успешно на сумму: \(amount)")
                    print("--------------------------------")
                } else {
                    print("На балансе не хватает денег для снятия!")
                    print("--------------------------------")
                }
                
            }
        } else {
            print("Такого аккаунта не существует или пароль неверный!")
            print("--------------------------------")
        }
        print("ПОСЛЕ: ")
        checkAccountInfo(name: account.name, password: account.password)
    }
    
    func transferMoney(from currentAccount: Account, to otherAccount: Account, amount: Double) {
        guard amount >= 0 else {
            print("Сумма не может быть меньше 0!")
            return
        }
        if checkForTransfer(account: currentAccount, amount: amount) {
            print("ДО: ")
            checkAccountInfo(name: currentAccount.name, password: currentAccount.password)
            checkAccountInfo(name: otherAccount.name, password: otherAccount.password)
            moneyOperation(account: currentAccount,
                           amount: amount,
                           type: .get)
            moneyOperation(account: otherAccount,
                           amount: amount,
                           type: .add)
            print("Со счета \(currentAccount.name) была переведена сумма \(amount) на счет \(otherAccount.name)")
            print("--------------------------------")
            print("ПОСЛЕ: ")
            checkAccountInfo(name: currentAccount.name, password: currentAccount.password)
            checkAccountInfo(name: otherAccount.name, password: otherAccount.password)
        } else {
            print("На счете \(currentAccount.name) недостаточно средств для перевода!")
            print("--------------------------------")
        }
    }
    
    
    // вывод подробной информации о счете
    func checkAccountInfo(name: String, password: Int) {
        if let account = accounts.first(where: { $0.name == name && $0.password == password }) {
            print("ИНФОРМАЦИЯ О СЧЕТЕ:")
            print("Название: \(account.name)")
            print("Номер счета: \(account.number)")
            print("Баланс: \(account.balance)")
            print("Транзакции:")
            account.operationsHistory.forEach { operation in
                print(operation)
            }
            print("--------------------------------")
        } else {
            print("Счет с таким названием и паролем не найден!")
            print("--------------------------------")
        }
    }
    
    // проверка, можно ли создать такой аккаунт
    private func checkForCreation(account: Account) -> Bool {
        !self.accounts.contains(where: { $0.name == account.name })
    }
    
    private func checkForTransfer(account: Account, amount: Double) -> Bool {
        if account.balance >= amount {
            return true
        } else {
            return false
        }
    }
}

let bank = TBank()
let firstAccount = Account(name: "First", number: "349 230 023 233", balance: 1000, password: 123)
let secondAccount = Account(name: "Second", number: "992 239 403 194", balance: 2000, password: 999)

// создание счетов в банке
bank.createAccount(accountInfo: firstAccount)
bank.createAccount(accountInfo: secondAccount)
// пополнение первого счета
bank.moneyOperation(account: firstAccount, amount: -100, type: .add)
// снятие денег со второго счета
bank.moneyOperation(account: secondAccount, amount: 200, type: .get)
// перевод денег со второго счета на первый
bank.transferMoney(from: secondAccount, to: firstAccount, amount: 150)
