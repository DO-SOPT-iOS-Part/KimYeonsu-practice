//
//  GalleryViewController.swift
//  3Week-seminar
//
//  Created by yeonsu on 10/28/23.
//

import UIKit

class GalleryViewController: UIViewController {
    
    // 객체 생성
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
        $0.backgroundColor = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setCollectionViewConfig()
        setCollectionViewLayout()
    }
    
    private func setLayout() {
        self.view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setCollectionViewConfig() {
        self.collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    private func setCollectionViewLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 6) / 3 , height: (UIScreen.main.bounds.width - 6) / 3)
        flowLayout.minimumLineSpacing = 3
        flowLayout.minimumInteritemSpacing = 3
        self.collectionView.setCollectionViewLayout(flowLayout, animated: false)
    }
}

extension GalleryViewController: UICollectionViewDelegate{}

extension GalleryViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageCollectionList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier,
                                                            for: indexPath) as? ImageCollectionViewCell else {return UICollectionViewCell()}
        item.likeTapCompletion = { [weak self] state in
            guard let self else { return }
            imageCollectionList[indexPath.row].isLiked = state
        }
        item.bindData(data: imageCollectionList[indexPath.row], row: indexPath.row)
        return item
    }
}

extension GalleryViewController: ItemSelectedProtocol {
    func getButtonState(state: Bool, row: Int) {
        imageCollectionList[row].isLiked = state
    }
}
