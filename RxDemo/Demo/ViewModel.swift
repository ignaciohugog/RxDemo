import Foundation
import RxSwift

class ViewModel {

    let firstName = Variable<String?>(nil)
    let lastName = Variable<String?>(nil)
    let mail = Variable<String?>(nil)
    let isValid = Variable(false)

    init() {

        let _ = Observable.combineLatest(firstName.asObservable(), lastName.asObservable(), mail.asObservable())
            .map { (firstName, lastName, mail) -> Bool in
                guard let firstName = firstName, let lastName = lastName, let mail = mail else {
                    return false
                }
                return !firstName.isEmpty && !lastName.isEmpty && !mail.isEmpty
            }.bind(to: isValid)
        
    }
}
