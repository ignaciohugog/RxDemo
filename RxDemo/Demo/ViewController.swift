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
        
    }
}
