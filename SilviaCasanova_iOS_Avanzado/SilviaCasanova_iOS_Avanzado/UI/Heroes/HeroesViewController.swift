//
//  HeroesViewController.swift
//  SilviaCasanova_iOS_Avanzado
//
//  Created by Silvia Casanova Martinez on 24/10/23.
//

import UIKit

// MARK: - View Protocol -
protocol HeroesViewControllerDelegate {
    var viewState: ((HeroesViewState) -> Void)? { get set }
    var heroesCount: Int { get }

    func onViewAppear()
    func getheroBy(index: Int) -> Hero?
    //func heroDetailViewModel(index: Int) -> HeroDetailViewControllerDelegate?
}

// MARK: - View State -
enum HeroesViewState {
    case loading(_ isLoading: Bool)
    case updateData
}

// MARK: - Class -
class HeroesViewController: UIViewController {
    // MARK: - IBOutlet -
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loader: UIView!

    // MARK: - Public Properties -
    var viewModel: HeroesViewControllerDelegate?

    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        setObservers()
        viewModel?.onViewAppear()
    }

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard segue.identifier == "HEROES_TO_HERO_DETAIL",
//              let index = sender as? Int,
//              let heroDetailViewController = segue.destination as? HeroDetailViewController,
//              let detailViewModel = viewModel?.heroDetailViewModel(index: index) else {
//            return
//        }
//
//        heroDetailViewController.viewModel = detailViewModel
//    }

    // MARK: - Private functions -
    private func initViews() {
        tableView.register(
            UINib(nibName: CustomTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: CustomTableViewCell.identifier
        )

        tableView.delegate = self
        tableView.dataSource = self
    }

    private func setObservers() {
        viewModel?.viewState = { [weak self] state in
            DispatchQueue.main.async {
                switch state {
                    case .loading(let isLoading):
                        self?.loader.isHidden = !isLoading

                    case .updateData:
                        self?.tableView.reloadData()
                    
                    print()
                }
            }
        }
    }
}

extension HeroesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.heroesCount ?? 0
    }

//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        HeroCellView.estimatedHeight
//    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier,
                                                       for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }

        if let hero = viewModel?.getheroBy(index: indexPath.row) {
            cell.updateData(
                name: hero.name,
                photo: hero.photo,
                decription: hero.description
            )
        }

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "HEROES_TO_HERO_DETAIL",
                     sender: indexPath.row)
    }
}


