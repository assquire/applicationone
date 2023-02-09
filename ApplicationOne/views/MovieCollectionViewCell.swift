//
//  MovieCollectionViewCell.swift
//  ApplicationOne
//
//  Created by Askar on 30.01.2023.
//

import UIKit

final class MovieCollectionViewCell: UICollectionViewCell {
    
    private var genreList: [Int:String] = [:]
    
    private let wholeView = UIView()
    
    private lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "knives")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 5
        return imageView
    }()
    
    private lazy var movieNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .label
        label.text = "Knives Out 2: Glass Onion"
        return label
    }()
    
    private lazy var genresLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        label.textColor = .systemGray2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: MovieModel, and genreList: [Int:String]) {
        self.genreList = genreList
        var stringGenreList: [String] = []
        for i in 0..<model.genreIds.count {
            stringGenreList.append(genreList[model.genreIds[i]] ?? "")
        }
        guard let url = URL(string: "\(Constants.Links.image)\(model.posterPath)") else { fatalError("Incorrect link to poster path!")}
        DispatchQueue.main.async {
            self.posterImageView.kf.setImage(with: url)
            self.movieNameLabel.text = model.title
            self.genresLabel.text = stringGenreList.joined(separator: ", ")
        }
    }
}

//MARK: - Setup views and constraints

private extension MovieCollectionViewCell {
    
    func setupViews() {
        contentView.addSubview(wholeView)
        wholeView.addSubview(posterImageView)
        wholeView.addSubview(movieNameLabel)
        wholeView.addSubview(genresLabel)
    }
    
    func setupConstraints() {
        wholeView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(5)
        }
        posterImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.7)
        }
        movieNameLabel.snp.makeConstraints { make in
            make.top.equalTo(posterImageView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.2)
        }
        genresLabel.snp.makeConstraints { make in
            make.top.equalTo(movieNameLabel.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
