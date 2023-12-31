//
//  ItemListTableViewCell.swift
//  3Week-seminar
//
//  Created by yeonsu on 10/28/23.
//

import UIKit
import SnapKit
import Then

class ItemListTableViewCell: UITableViewCell {
    
    static let identifier: String = "ItemListTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    // UIView와 UIViewController는 NSCoding 프로토콜을 채택하고 있고,
    // NSCoding에 명시된 init 함수는 init(coder: _) 이기 때문에 필수 구현
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // 객체 생성
    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
        $0.spacing = 8
    }
    
    private let productImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }
    
    private let productNameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16)
        $0.numberOfLines = 2
        $0.textColor = .white
    }
    
    private let locationLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .lightGray
    }
    
    private let priceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 18, weight: .black)
        $0.textColor = .white
    }
    
    
    // .addTarget() 토글 버튼은 대부분 lazy var로 구현
    private lazy var likeButton = UIButton().then {
        $0.addTarget(self,
                     action: #selector(likeButtonTapped),
                     for: .touchUpInside)
        $0.setImage(UIImage(systemName: "heart"), for: .normal)
        $0.setImage(UIImage(systemName: "heart.fill"), for: .selected)
    }
    
    
    var likeTapCompletion: ((Bool) -> Void)?
    
    // 좋아요 버튼 토글 함수
    @objc private func likeButtonTapped() {
        likeButton.isSelected.toggle()
        
        // cell 값 변경 시 실제 데이터에 적용 안 되는 이슈 해결
        guard let likeTapCompletion else {return}
        likeTapCompletion(likeButton.isSelected)
    }
    
    // cell의 재사용 이슈 해결
    override func prepareForReuse() {
        super.prepareForReuse()
        self.likeButton.isSelected = false
    }
    
    // 레이아웃 함수
    private func setLayout() {
        self.backgroundColor = .init(red: 33.0 / 255.0,
                                     green: 33.0 / 255.0,
                                     blue: 33.0 / 255.0,
                                     alpha: 1.0)
        
        [productImageView, stackView, likeButton].forEach {
            self.contentView.addSubview($0)
        }
        
        [productNameLabel, locationLabel, priceLabel].forEach {
            self.stackView.addArrangedSubview($0)
        }
        
        productImageView.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(16)
            $0.width.height.equalTo(128)
        }
        productImageView.layer.cornerRadius = 5
        productImageView.clipsToBounds = true
        
        stackView.snp.makeConstraints {
            $0.leading.equalTo(productImageView.snp.trailing).offset(16)
            $0.top.trailing.equalToSuperview().inset(16)
        }
        
        likeButton.snp.makeConstraints {
            $0.top.equalTo(productImageView.snp.bottom)
            $0.trailing.bottom.equalToSuperview().inset(16)
        }
    }
    
    func bindData(data: ItemListData) {
        self.productImageView.image = UIImage(named: data.image)
        self.productNameLabel.text = data.item
        self.priceLabel.text = data.price
        self.locationLabel.text = data.location
        self.likeButton.isSelected = data.isLike
    }
}
