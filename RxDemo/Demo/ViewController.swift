import UIKit
import RxSwift
import RxCocoa

class ViewController: UITableViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    let viewModel = ViewModel()

    override func viewDidLoad() {

        super.viewDidLoad()

        let _ = firstNameTextField.rx.text.bind(to: viewModel.firstName)
        let _ = lastNameTextField.rx.text.bind(to: viewModel.lastName)
        let _ = emailTextField.rx.text.bind(to: viewModel.mail)
        let _ = viewModel.isValid.asObservable().bind(to: nextButton.rx.isEnabled)    
    }
}
