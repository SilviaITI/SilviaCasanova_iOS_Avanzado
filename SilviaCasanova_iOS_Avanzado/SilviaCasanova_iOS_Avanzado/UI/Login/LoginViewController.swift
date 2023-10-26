//
//  LoginViewController.swift
//  SilviaCasanova_iOS_Avanzado
//
//  Created by Silvia Casanova Martinez on 23/10/23.
//

import UIKit

protocol LoginViewControllerDelegate {
    func onLoginPressed(email: String?, password: String?)
    var viewState: ((LoginViewState) -> Void)? { get set }

}
enum LoginViewState {
    case loading(_ isLoading: Bool)
    case showErrorEmail(_ error: String?)
    case showErrorPassword(_ error: String?)
    case navigateToHeroes
}

class LoginViewController: UIViewController {

    // MARK: -Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailFailLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordFailLabel: UILabel!
    @IBOutlet weak var loader: UIView!
    
  
    var viewModel: LoginViewControllerDelegate?
    
  
    // MARK: - LyfeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setObservers()
        
        // Do any additional setup after loading the view.
    }
  
    // MARK: - Functions
    
    @IBAction func onLoginPressed(_ sender: Any) {
                viewModel?.onLoginPressed(
                    email: emailTextField.text,
                    password: passwordTextField.text)
    }

    
    private func setObservers() {
           viewModel?.viewState = { [weak self] state in
               DispatchQueue.main.async {
                   switch state {
                       case .loading(let isLoading):
                           self?.loader.isHidden = !isLoading

                       case .showErrorEmail(let error):
                           self?.emailFailLabel.text = error
                           self?.loader.isHidden = (error == nil || error?.isEmpty == true)

                       case .showErrorPassword(let error):
                           self?.passwordFailLabel.text = error
                           self?.passwordFailLabel.isHidden = (error == nil || error?.isEmpty == true)

                       case .navigateToHeroes:
                           self?.performSegue(withIdentifier: "LOGIN_TO_HEROES",
                                              sender: nil)
                   }
               }
           }
       }
   }



