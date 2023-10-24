//
//  SplashViewController.swift
//  SilviaCasanova_iOS_Avanzado
//
//  Created by Silvia Casanova Martinez on 23/10/23.
//

import UIKit
protocol SplashViewControllerProtocol {
    var viewState: ((SplashViewState) -> Void)? { get set }
    var loginViewModel: LoginViewControllerDelegate { get }
    var heroesViewModel: HeroesViewControllerDelegate { get }
    func onViewAppear()
}
enum SplashViewState {
    case loading(_ isLoading: Bool)
    case navigateToLogin
    case navigateToHeroes
}
class SplashViewController: UIViewController {

    @IBOutlet weak var loadingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onViewAppear()
        // Do any additional setup after loading the view.
    }
    
    var viewModel: SplashViewControllerProtocol?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         switch segue.identifier {
             case "SPLASH_TO_LOGIN":
                 guard let loginViewController = segue.destination as? LoginViewController else { return }
                 loginViewController.viewModel = viewModel?.loginViewModel

             case "SPLASH_TO_HEROES":
                 guard let heroesViewController = segue.destination as? HeroesViewController else { return }
                 heroesViewController.viewModel = viewModel?.heroesViewModel

             default:
                 break
         }
     }
    
    func onViewAppear() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            self.performSegue(withIdentifier: "SPLASH_TO_LOGIN", sender: nil)
        }
    }
}

