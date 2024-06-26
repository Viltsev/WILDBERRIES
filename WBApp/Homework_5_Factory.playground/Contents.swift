import UIKit

class Person {
    let id: UUID = UUID()
    var fullName: String
    var age: Int
    var passport: Passport?
    
    init(fullName: String, age: Int, passport: Passport? = nil) {
        self.fullName = fullName
        self.age = age
        self.passport = passport
        
        print("Инициализация человека с именем \(fullName)")
    }
    
    deinit {
        print("Деинициализация человека с именем \(fullName)")
    }
}

class Passport {
    var seria: Int
    var number: Int
    var date: String
    weak var person: Person?
    
    init(seria: Int, number: Int, date: String, person: Person? = nil) {
        self.seria = seria
        self.number = number
        self.date = date
        self.person = person
        
        print("Инициализация паспорта (\(seria) \(number))\n")
    }
    
    deinit {
        print("Деинициализация паспорта (\(seria) \(number))\n")
    }
}

class FactoryMaterial {
    var title: String
    var price: Double
    
    init(title: String, price: Double) {
        self.title = title
        self.price = price
        
        print("Инициализация материала \(title)")
    }
    
    deinit {
        print("Деинициализация материала \(title)")
    }
}

class Factory {
    var name: String
    var materials: [FactoryMaterial] = []
    var workers: [Person] = []
    
    init(name: String) {
        self.name = name
        print("Инициализация фабрики \(name)")
    }
    
    deinit {
        print("Деинициализация фабрики \(name)")
    }
    
    func updateMaterials(material: FactoryMaterial) {
        self.materials.append(material)
        print("Добавлен на фабрику новый материал - \(material)")
    }
    
    func addWorker(worker: Person) {
        self.workers.append(worker)
        print("На фабрику устроился новый рабочий - \(worker)")
    }
}


var firstWorker = Person(fullName: "Петров Петр Петрович", age: 28)
let firstPassport = Passport(seria: 1134, number: 492952, date: "24.12.2014")
firstWorker.passport = firstPassport

var secondWorker = Person(fullName: "Иванов Иван Иванович", age: 32)
let secondPassport = Passport(seria: 4251, number: 953921, date: "24.08.2009")
secondWorker.passport = secondPassport


let firstMaterial = FactoryMaterial(title: "Медь", price: 1000)
let secondMaterial = FactoryMaterial(title: "Алюминий", price: 2000)

var factory = Factory(name: "Фабрика")
factory.updateMaterials(material: firstMaterial)
factory.updateMaterials(material: secondMaterial)
factory.addWorker(worker: firstWorker)
factory.addWorker(worker: secondWorker)


