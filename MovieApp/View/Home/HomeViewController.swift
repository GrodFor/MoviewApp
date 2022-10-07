//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Vladislav Sitsko on 06.10.2022.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    
    // MARK: Constants
    private static let countOfRows: CGFloat = 2
    private static let cellSpacing: CGFloat = 70
    private static let reuseIdentifier = "PosterListTableViewCell"
    
    private let viewModel: HomeViewModel
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(
            PosterListTableViewCell.self,
            forCellReuseIdentifier: Self.reuseIdentifier
        )
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.refreshControl = refreshControl
        
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0
        }
        
        return tableView
    }()
    
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .white
        refreshControl.addTarget(self, action: #selector(updateData), for: .valueChanged)
        return refreshControl
    }()
    
    private var isConstraintsCreationNeeded = true
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        updateData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        setupConstraintsIfNeeded()
    }
    
    private func setupConstraintsIfNeeded() {
        guard isConstraintsCreationNeeded else {
            return
        }
        isConstraintsCreationNeeded.toggle()
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc private func updateData() {
        refreshControl.beginRefreshing()
        viewModel.updateHomeScreen { [weak self] error in
            guard let self = self else { return }
            if let error = error {
                self.showError(error)
            } else {
                self.tableView.reloadData()
            }
            self.refreshControl.endRefreshing()
        }
    }
}

//MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.reuseIdentifier) as! PosterListTableViewCell
        
        switch indexPath.section {
        case 0:
            cell.dataSource = viewModel.popularMovies
        case 1:
            cell.dataSource = viewModel.topRatedMovies
        default:
            cell.dataSource = .empty()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Popular movies"
        case 1:
            return "Top rated movies"
        default:
            return .none
        }
    }
}

//MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 285 + (Self.cellSpacing / 2) //(UIScreen.main.bounds.size.height * 0.5) - (Self.cellSpacing * Self.countOfRows)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Self.cellSpacing
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textColor = .white
        header.textLabel?.font = .systemFont(ofSize: 30, weight: .bold)
        header.textLabel?.frame = header.bounds
        view.tintColor = UIColor(named: "backgrondColor")
    }
}
