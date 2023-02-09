//
//  PosterTableViewCell.swift
//  ApplicationOne
//
//  Created by Askar on 07.02.2023.
//

import UIKit

final class PosterTableViewCell: UITableViewCell {
    
    private lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        return imageView
    }()
    
    private var labelView = UIView()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.boldSystemFont(ofSize: label.font.pointSize)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        return label
    }()
    
    private lazy var taglineLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGray2
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        return label
    }()
    
    private lazy var overviewLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.2
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: DetailedMovieModel) {
        let urlString = "\(Constants.Links.image)\(model.posterPath)"
        guard let url = URL(string: urlString) else { return }
        DispatchQueue.main.async {
            self.posterImageView.kf.setImage(with: url)
            self.titleLabel.text = model.title
            self.taglineLabel.text = model.tagline
            self.overviewLabel.text = model.overview
        }
    }
}

//MARK: - Setup views and constraints

private extension PosterTableViewCell {
    
    func setupViews() {
        contentView.addSubview(posterImageView)
        contentView.addSubview(labelView)
        labelView.addSubview(titleLabel)
        labelView.addSubview(taglineLabel)
        labelView.addSubview(overviewLabel)
    }
    
    func setupConstraints() {
        posterImageView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview().inset(10)
            make.width.equalToSuperview().multipliedBy(0.35)
        }
        labelView.snp.makeConstraints { make in
            make.leading.equalTo(posterImageView.snp.trailing).offset(10)
            make.top.trailing.bottom.equalToSuperview().inset(10)
        }
        titleLabel.snp.makeConstraints { make in
            make.leading.top.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.2)
        }
        taglineLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.2)
        }
        overviewLabel.snp.makeConstraints { make in
            make.top.equalTo(taglineLabel.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
