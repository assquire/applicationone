//
//  DetailsViewController.swift
//  ApplicationOne
//
//  Created by Askar on 07.02.2023.
//

import UIKit

final class DetailsViewController: UIViewController {
        
    var apiCaller: APICaller?
    private var movieId: Int?
    private var detailedMovieModel: DetailedMovieModel?
    
    private lazy var mainTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        apiCaller?.delegate = self
        
        apiCaller?.fetchRequest(with: movieId ?? 1)
        mainTableView.dataSource = self
        mainTableView.delegate = self
        
        setupViews()
        setupConstraints()
    }
    
    func configure(with id: Int) {
        movieId = id
    }
}

//MARK: - APICaller delegate methods

extension DetailsViewController: APICallerDelegate {
    func didUpdateDetailedModel(with model: DetailedMovieModel) {
        self.detailedMovieModel = model
        DispatchQueue.main.async {
            self.mainTableView.reloadData()
        }
    }
}

//MARK: - Table view data source and delegate methods

extension DetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let detailedMovieModel, indexPath.row == 0 {
            let cell = PosterTableViewCell()
            cell.configure(with: detailedMovieModel)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.Values.screenHeight * 0.25
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = DetailsHeaderView()
        if let detailedMovieModel {
            view.configure(with: detailedMovieModel)
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.Values.screenHeight * 0.25
    }
}

//MARK: - Setup views and constraints

private extension DetailsViewController {
    
    func setupViews() {
        view.addSubview(mainTableView)
    }
    
    func setupConstraints() {
        mainTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

// UIScreen.main.bounds.height
