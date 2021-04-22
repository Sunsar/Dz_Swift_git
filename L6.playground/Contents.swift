import Foundation
//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.


struct Queue<T> {
    private var stack = [T]()
    
    mutating func enqueue(_ item: T) {
        stack.append(item)
    }
    
    mutating func dequeue() -> T? {
        guard stack.count > 0 else { return nil }
        return stack.removeFirst()
    }
    
    func filter( _ predicate: (T) -> Bool ) -> [T] {
        var result = [T]()
        for item in stack {
            if predicate(item) {
                result.append(item)
            }
        }
        return result
    }
}
//extension Queue {
//    subscript(index: Int) -> T? {
//        guard index >= 0 && index < stack.count else {
//            return nil
//        }
//        return stack(index)
//    }
//}

var queue = Queue<Int>()
queue.enqueue(10)
queue.enqueue(20)
queue.enqueue(30)


// -------------------------------------

class Factory {
    private var employees = [
        "Сергей": 1000,
        "Иван": 3230,
        "Николай": 2532
    ]
    
    
    func fireAll() {
        employees.removeAll()
    }
    
    func salary(name: String) -> Int? {
        return employees[name]
    }
    
    func avarageSalary() -> Int {
        guard employees.count > 0 else { return 0 }
        
        var totalSalary = 0
        for employee in employees {
            totalSalary += employee.value
        }
        
        return totalSalary / employees.count
    }
}

let factory = Factory()
factory.fireAll()
print(factory.avarageSalary())

