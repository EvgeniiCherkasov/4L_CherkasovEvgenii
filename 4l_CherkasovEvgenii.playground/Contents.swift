import UIKit

class Car {
    var mark: String
    var year: Int
    var valumeOfTrunk: Int = 100
    var isEngineStarted: Bool = false
    var isWindowOpen: Bool = false
    var fullnesOfTrunk: Int = 0
    
    init(mark: String, year: Int, valumeOfTrunk: Int){
        self.mark = mark
        self.year = year
        self.valumeOfTrunk = valumeOfTrunk
    }
    
    enum actionOfCar{
        case startEngine
        case stopEngine
        case openWindow
        case closeWindow
        case putSmthToTrunk (weight: Int)
        case takeSmthFromTrunk (weight: Int)
    }
    
    func discription(){
        print("Марка автомобиля \(mark). Год выпуска: \(year). Окно \(isWindowOpen ? "открыто" : "закрыто"). Двигатель \(isEngineStarted ? "запущен" : "заглушен"). Объем багажника: \(valumeOfTrunk). Багажник заполнен на \(fullnesOfTrunk)")
    }
    
    func basicActions(action: actionOfCar){
        
        switch action {
        
        case .startEngine:
            if self.isEngineStarted == false{
                self.isEngineStarted = true
            }else{
                print("Двигатель уже запущен.")
            }
        case .stopEngine:
            if self.isEngineStarted == true{
                self.isEngineStarted = false
            }else{
                print("Двигатель уже заглушен.")
            }
            
        case .openWindow:
            if self.isWindowOpen == false{
                self.isWindowOpen = true
            }else{
                print("Окно уже открыто")
            }
        case .closeWindow:
            if self.isWindowOpen == true{
                self.isWindowOpen = false
            }else{
                print("Окно уже закрыто")
            }
        case .putSmthToTrunk(weight: let weight):
            if self.fullnesOfTrunk + weight <= self.valumeOfTrunk {
                self.fullnesOfTrunk += weight
                
            }else{
                print("Невозможно положить горуз объемом \(weight). Осталось свободного места \(valumeOfTrunk - fullnesOfTrunk)")
            }
        case .takeSmthFromTrunk(weight: let weight):
            if self.fullnesOfTrunk - weight >= 0{
                self.fullnesOfTrunk -= weight
            }else{
                print("Невозможно достать запрашиваемый груз. В багажнике осталось \(self.fullnesOfTrunk)")
            }
        }
    }
}

class SportCar: Car{
    
    var sportModeState: Bool = false
    
    override init(mark: String, year: Int, valumeOfTrunk: Int) {
        
        super.init(mark: mark, year: year, valumeOfTrunk: valumeOfTrunk)
        
        if valumeOfTrunk < 100{
                    self.valumeOfTrunk = valumeOfTrunk
        }else{
            self.valumeOfTrunk = 100
        print("Слишком большой обьем багажника для легкового автомобиля. В созданном автомобиле объем уменьшен до 100.")
        }
    }
    
    enum actionOfSportCar{
        case sportModeOn
        case sportModeOff
    }
    
    func actionOfSportCar(action: actionOfSportCar){
        
        switch action {
        
        case .sportModeOn:
            if self.sportModeState == false{
                self.sportModeState = true
            }else{
                print("Спорт режим уже включен.")
            }
        case .sportModeOff:
            if self.sportModeState == true{
                self.sportModeState = false
            }else{
                print("Спорт режим уже выключен")
            }
        }
    }
    
    override func discription() {
        print("Марка автомобиля \(mark). Год выпуска: \(year). Окно \(isWindowOpen ? "открыто" : "закрыто"). Двигатель \(isEngineStarted ? "запущен" : "заглушен"). Спорт режим \(sportModeState ? "включен": "выключен.") Объем багажника: \(valumeOfTrunk). Багажник заполнен на \(fullnesOfTrunk)")
    }
}


var BMW = SportCar(mark: "BMW", year: 2021, valumeOfTrunk: 110)
BMW.actionOfSportCar(action: .sportModeOn)
BMW.basicActions(action: .startEngine)
BMW.discription()


class TruckCar: Car{
    
    var isTrailerAttached: Bool = false
    var trailerValume: Int = 0
    
    override init(mark: String, year: Int, valumeOfTrunk: Int) {
        
        super.init(mark: mark, year: year, valumeOfTrunk: valumeOfTrunk)
        
        if valumeOfTrunk > 100{
            self.valumeOfTrunk = valumeOfTrunk
        }else{
            self.valumeOfTrunk = 100
        print("Слишком маленький обьем багажника для грузового автомобиля. В созданном автомобиле объем увеличен до 100.")
        }
    }
    
    enum actionOfTruckCar{
        case attachTrailer
        case unhitchTrailer
    }
    
    func actionOfTruckCar(action: actionOfTruckCar){
        
        switch action {
        
        case .attachTrailer:
            if self.isTrailerAttached == false{
                self.isTrailerAttached = true
            }else{
                print("Прицеп уже есть.")
            }
        case .unhitchTrailer:
            if self.isTrailerAttached == true{
                self.isTrailerAttached = false
            }else{
                print("Прицеп уже снят.")
            }
        }
    }
    
    override func discription() {
        print("Марка автомобиля \(mark). Год выпуска: \(year). Окно \(isWindowOpen ? "открыто" : "закрыто"). Двигатель \(isEngineStarted ? "запущен" : "заглушен"). Прицеп \(isTrailerAttached ? "присоединен": "отсоединен.") Объем багажника: \(valumeOfTrunk). Багажник заполнен на \(fullnesOfTrunk)")
    }
}

var man = TruckCar(mark: "MAN", year: 2020, valumeOfTrunk: 250)
man.discription()

man.actionOfTruckCar(action: .attachTrailer)
man.basicActions(action: .openWindow)
man.basicActions(action: .putSmthToTrunk(weight: 220))
man.basicActions(action: .stopEngine)
man.basicActions(action: .startEngine)
man.discription()

