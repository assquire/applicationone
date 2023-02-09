//
//  CategoryTableViewCell.swift
//  ApplicationOne
//
//  Created by Askar on 24.01.2023.
//

import UIKit

final class CategoryTableViewCell: UITableViewCell {
    
    var apiCaller: APICaller?
    var navigationController: UINavigationController?
    
    private var movieList: [MovieModel] = []
    private var genreList: [Int:String] = [:]
    
    private lazy var movieCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MovieCollectionViewCell.self, forCellWithReuseIdentifier: Constants.Identifiers.movieCollectionViewCell)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        movieCollectionView.dataSource = self
        movieCollectionView.delegate = self
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with movieList: [MovieModel], and genreList: [Int:String]) {
        self.movieList = movieList
        self.genreList = genreList
        DispatchQueue.main.async {
            self.movieCollectionView.reloadData()
        }
    }
}

//MARK: - Collection view data source and delegate methods

extension CategoryTableViewCell: UICollectionViewDataSource {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.Identifiers.movieCollectionViewCell, for: indexPath) as! MovieCollectionViewCell
        cell.clipsToBounds = true
        cell.configure(with: movieList[indexPath.row], and: genreList)
        return cell
    }
}

extension CategoryTableViewCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.size.height
        return CGSize(width: height/2, height: height)
    }
}

extension CategoryTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailsViewController()
        vc.apiCaller = self.apiCaller
        vc.configure(with: movieList[indexPath.item].id)
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - Setup views and constraints

private extension CategoryTableViewCell {
    
    func setupViews() {
        contentView.addSubview(movieCollectionView)
    }
    
    func setupConstraints() {
        movieCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
