//
//  ImageCollectionViewCell.swift
//  3Week-seminar
//
//  Created by yeonsu on 10/28/23.
//

import UIKit
import SnapKit
import Then

protocol ItemSelectedProtocol: NSObject {
    func getButtonState(state: Bool, row: Int)
}

class ImageCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "ImageCollectionViewCell"
    
    // 이미지뷰 객체 생성
    private let imageView = UIImageView()
    
    weak var delegate: ItemSelectedProtocol?
    var likeTapCompletion: ((Bool) -> Void)?
    
    @objc private func likeButtonTap() {
        self.likeButton.isSelected.toggle()
        if let itemRow {
            self.delegate?.getButtonState(state: self.likeButton.isSelected,
                                          row: itemRow)
        }
        guard let likeTapCompletion else {return}
        likeTapCompletion(likeButton.isSelected)
    }
    
    
    
    private lazy var likeButton = UIButton().then {
        $0.setImage(UIImage(systemName: "heart"), for: .normal)
        $0.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        $0.addTarget(self,
                     action: #selector(likeButtonTap),
                     for: .touchUpInside)
    }
    
    // cell의 재사용 이슈 해결
    override func prepareForReuse() {
        super.prepareForReuse()
        self.likeButton.isSelected = false
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var itemRow: Int?
    
    func bindData(data: ImageCollectionData, row: Int) {
        self.imageView.image = UIImage(named: data.image)
        self.likeButton.isSelected = data.isLiked
        self.itemRow = row
    }
    
    private func setLayout() {
        [imageView, likeButton].forEach {
            self.contentView.addSubview($0)
        }
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        likeButton.snp.makeConstraints {
            $0.bottom.trailing.equalToSuperview().inset(16)
        }
    }
    
    
}
