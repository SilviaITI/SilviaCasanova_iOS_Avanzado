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
    
    var cellIdentifier = "CUSTOM_CELL"
    
    @IBOutlet weak var loader: UIView!
    @IBOutlet weak var heroesTable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        heroesTable.reloadData()
        initViews()
        viewModel?.onViewAppear()
        // Do any additional setup after loading the view.
    }
    
    var viewModel: HeroesViewControllerDelegate?
    
    private func initViews() {
        heroesTable.register(
            UINib(nibName: "CustomTableViewCell", bundle: nil),
            forCellReuseIdentifier: "CUSTOM_CELL"
        )
        
        heroesTable.delegate = self
        heroesTable.dataSource = self
    }
    
   
    private func setObservers() {
        viewModel?.viewState = { [weak self] state in
            DispatchQueue.main.async {
                switch state {
                    case .loading(let isLoading):
                        self?.loader.isHidden = !isLoading

                    case .updateTable:
                    self?.heroesTable.reloadData()
                case .navigateToDetail:
                    print("heroes")
                }
            }
        }
    }
  
}
extension HeroesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.heroCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CUSTOM_CELL", for: indexPath) as? CustomTableViewCell else{
            return UITableViewCell()
        }
        if let hero = viewModel?.getHeroBy(index: indexPath.row) {
            cell.updateData(name: hero.name,
                                      photo: hero.photo,
                                      decription: hero.description)
        }
        return cell
    }
    
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


