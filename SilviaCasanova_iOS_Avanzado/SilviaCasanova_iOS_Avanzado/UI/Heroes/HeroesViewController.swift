//
//  HeroesViewController.swift
//  SilviaCasanova_iOS_Avanzado
//
//  Created by Silvia Casanova Martinez on 24/10/23.
//

import UIKit
protocol HeroesViewControllerDelegate {
    var viewState: ((HeroesViewState) -> Void)? { get set }
    var heroCount: Int { get }
    func onViewAppear()
    func getHeroBy(index: Int) -> Hero?
}
enum HeroesViewState {
     case loading(_ isLoading: Bool)
    case navigateToDetail
    case updateTable
}
class HeroesViewController: UIViewController {

    
    @IBOutlet weak var loader: UIView!
    @IBOutlet weak var heroesTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    var viewModel: HeroesViewControllerDelegate?
    
    func onViewAppear() {
        
    }
    func getHeroBy(index: Int) -> Hero? {
       
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
