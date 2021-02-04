//
//  PresetsView.swift
//  meditation
//
//  Created by Timo Metsälä on 4.2.2021.
//

import UIKit
import SnapKit

class PresetViewCell: UICollectionViewCell {
    static let id = "PresetViewCell"
    let title = UILabel()
    let descriptionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        title.textColor = UIColor.black
        descriptionLabel.textColor = UIColor.black
        
        addSubview(title)
        addSubview(descriptionLabel)
        
        title.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(10)
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(10)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(title.snp.bottom).offset(10)
            make.leading.trailing.equalTo(safeAreaLayoutGuide).inset(10)
            make.bottom.equalToSuperview().inset(10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class PresetsView: UIView {
    let openDetails: (Int)->()

    init(openDetails: @escaping (Int)->()) {
        self.openDetails = openDetails
        super.init(frame: CGRect.zero)

        let title = UILabel()
        title.text = "Presets"
        
        addSubview(title)

        title.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(10)
            make.height.equalTo(50)
            make.left.right.equalToSuperview().inset(10)
        }

        let config = UICollectionLayoutListConfiguration(appearance: .plain)
        let layout = UICollectionViewCompositionalLayout.list(using: config)

        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.register(PresetViewCell.self, forCellWithReuseIdentifier: PresetViewCell.id)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints { (make) in
            make.top.equalTo(title.snp.bottom)
            make.left.right.bottom.equalToSuperview()
        }        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PresetsView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.openDetails(indexPath.row)
    }
}

extension PresetsView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PresetViewCell.id, for: indexPath) as? PresetViewCell else {
            fatalError("urgh dequeue")
        }
        cell.backgroundColor = UIColor.white
        cell.title.text = "Preset \(indexPath.row)"
        cell.descriptionLabel.text = "Hello World"

        return cell
    }
}
