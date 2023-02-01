//
//  MyTableViewCell.swift
//  ApplicationOne
//
//  Created by Askar on 09.01.2023.
//

import UIKit

final class MyTableViewCell: UITableViewCell {
    
    static let IDENTIFIER = "MyTableViewCell"
        
    private lazy var itemCollectioView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 100, height: 175)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: MyCollectionViewCell.IDENTIFIER)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        itemCollectioView.dataSource = self
        itemCollectioView.delegate = self
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Collection view data source methods

extension MyTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MyCollectionViewCell.IDENTIFIER, for: indexPath) as! MyCollectionViewCell
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 20
        return cell
    }
}

//MARK: - Collection view delegate methods

extension MyTableViewCell: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! MyCollectionViewCell
        cell.setText(with: "\(Int.random(in: 0..<10))")
    }
}

//MARK: - Setup views and constraints methods

private extension MyTableViewCell {
    
    func setupViews() {
        contentView.addSubview(itemCollectioView)
    }
    
    func setupConstraints() {
        itemCollectioView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
