//
//  PracticeSnapKitViewController.swift
//  3Week-seminar
//
//  Created by yeonsu on 10/28/23.
//

import UIKit
import SnapKit
import Then

class PracticeSnapKitViewController: UIViewController {
    
    // 1. 객체 생성
    let blueView = UIView().then {
        $0.backgroundColor = .systemBlue
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(blueView)
        blueView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview().inset(100)
            // $0.edges.equalToSuperview().inset(100)
            // $0.centerX.centerY.equalToSuperview()
            // $0.size.equalTo(100)
        }
    }
}
