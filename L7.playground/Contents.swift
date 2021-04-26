import Foundation

//1.  Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.
//2.  Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.
//

enum LibraryErrors: Error{
    
    case inLibraryNotThisBook
    
    case notEnoughMoney
}

struct BookMy{
    
    var price: Int
    
    var numberOfBooks: Int
}


class Library {
    
    var deposite = 11
    
    
    var bookshelf = [
        
        "1": BookMy(price: 7, numberOfBooks: 5),
        
        "2": BookMy(price: 8, numberOfBooks: 0),
        
        "3": BookMy(price: 9, numberOfBooks: 3)]
    
    

    func getTheBook(withName: String) throws {
        
        guard var book = bookshelf[withName]
            
            else {
                
            throw LibraryErrors.inLibraryNotThisBook
        }
        
        guard book.numberOfBooks > 0 else {
            
            throw LibraryErrors.inLibraryNotThisBook
        }
        guard  book.price <= deposite else {
            
            throw LibraryErrors.notEnoughMoney
        }
        
        
        deposite -= book.price
        
        book.numberOfBooks -= 1
        
        bookshelf[withName] = book
        
        print("У тебя есть книга: \(withName)")
    }
}


func myStart(){
    
    let library = Library()

    try? library.getTheBook(withName: "1")

    library.deposite = 1
    
    library.bookshelf = ["1": BookMy(price: 7, numberOfBooks: 5)]


    do {
        try library.getTheBook(withName: "2")
        
    } catch LibraryErrors.inLibraryNotThisBook {
        
        print("Книги нет в библиотеке")
        
    } catch LibraryErrors.notEnoughMoney{
        
        print("Недостаточно средств")
    }
    catch{
        print("Какая-то ошибка")
    }

}
