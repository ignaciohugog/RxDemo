import Foundation
import XCTest

class RxDemoTests: XCTestCase {
    func testInvalid() {

        let viewModel = ViewModel()

        XCTAssertFalse(viewModel.isValid.value)

        viewModel.firstName.value = "Ignacio"
        XCTAssertFalse(viewModel.isValid.value)

        viewModel.lastName.value = "Gomez"
        XCTAssertFalse(viewModel.isValid.value)

        viewModel.mail.value = nil
        XCTAssertFalse(viewModel.isValid.value)

        viewModel.firstName.value = nil
        XCTAssertFalse(viewModel.isValid.value)

        viewModel.firstName.value = "Ignacio"
        viewModel.lastName.value = nil
        XCTAssertFalse(viewModel.isValid.value)

        viewModel.mail.value = "ignacio.gomez@mercadolibre.com"
        XCTAssertFalse(viewModel.isValid.value)
    }

    func testValid() {

        let viewModel = ViewModel()

        viewModel.firstName.value = "Ignacio"
        viewModel.lastName.value = "Gomez"
        viewModel.mail.value = "ignacio.gomez@mercadolibre.com"

        XCTAssertTrue(viewModel.isValid.value)
    }
}
