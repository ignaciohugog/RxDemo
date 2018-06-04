import Foundation
import RxSwift

class ViewModel {

    let firstName = Variable<String?>(nil)
    let lastName = Variable<String?>(nil)
    let mail = Variable<String?>(nil)
    let isValid = Variable(false)

    init() {}
}
