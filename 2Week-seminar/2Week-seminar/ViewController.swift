//
//  ViewController.swift
//  2Week-seminar
//
//  Created by yeonsu on 10/14/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        setLayout()
    }
    
    // 바둑판 생성
    private func setLayout() {
        [BadukEgg1, BadukEgg2, wall].forEach { [weak self] view in
            guard let self else {return}
            
            // 오토사이징마스크로 인한 constraints 충돌을 피하기 위한 코드
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
        }
        
        NSLayoutConstraint.activate([BadukEgg1.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100),
                                     BadukEgg1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100),
                                     BadukEgg1.widthAnchor.constraint(equalToConstant: 6),
                                     BadukEgg1.heightAnchor.constraint(equalToConstant: 6)])
        
        NSLayoutConstraint.activate([BadukEgg2.topAnchor.constraint(equalTo: BadukEgg1.topAnchor, constant: 10),
                                     BadukEgg2.leadingAnchor.constraint(equalTo: BadukEgg1.leadingAnchor, constant: 10),
                                     BadukEgg2.widthAnchor.constraint(equalToConstant: 6),
                                     BadukEgg2.heightAnchor.constraint(equalToConstant: 6)])
        NSLayoutConstraint.activate([wall.topAnchor.constraint(equalTo: BadukEgg2.topAnchor, constant: 10),
                                     wall.leadingAnchor.constraint(equalTo: BadukEgg2.leadingAnchor, constant: 10),
                                     wall.widthAnchor.constraint(equalToConstant: 60),
                                     wall.heightAnchor.constraint(equalToConstant: 20)])
    }
    
    // 바둑알 생성
    let BadukEgg1: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 6, height: 6)))
        
        view.backgroundColor = .black
        view.layer.cornerRadius = 3
        view.clipsToBounds = true
        return view
    }()
    
    let BadukEgg2: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 6, height: 6)))
        
        view.backgroundColor = .black
        view.layer.cornerRadius = 3
        view.clipsToBounds = true
        return view
    }()
    
    let wall: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: 60, height: 20)))
        
        view.backgroundColor = .blue
        view.layer.cornerRadius = 3
        view.clipsToBounds = true
        return view
    }()


}

