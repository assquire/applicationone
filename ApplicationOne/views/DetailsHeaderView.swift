//
//  DetailsHeaderView.swift
//  ApplicationOne
//
//  Created by Askar on 07.02.2023.
//

import UIKit

final class DetailsHeaderView: UIView {
    
    private lazy var backdropImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: DetailedMovieModel) {
        let urlString = "\(Constants.Links.image)\(model.backdropPath)"
        guard let url = URL(string: urlString) else { return }
        DispatchQueue.main.async {
            self.backdropImageView.kf.setImage(with: url)
        }
    }
}

//MARK: - Setup views and constraints

private extension DetailsHeaderView {
    
    func setupViews() {
        addSubview(backdropImageView)
    }
    
    func setupConstraints() {
        backdropImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
