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
        [myView1, myView2, myView3, myView4].forEach { [weak self] view in
            guard let self else {return}
            
            // 오토사이징마스크로 인한 constraints 충돌을 피하기 위한 코드
            view.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(view)
        }
        
        NSLayoutConstraint.activate([myView1.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
                                     myView1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0),
                                     myView1.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
                                     myView1.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4)])
        
        NSLayoutConstraint.activate([myView2.topAnchor.constraint(equalTo: myView1.bottomAnchor, constant: 0),
                                     myView2.leadingAnchor.constraint(equalTo: myView1.trailingAnchor, constant: 0),
                                     myView2.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
                                     myView2.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4)])
        
        NSLayoutConstraint.activate([myView3.topAnchor.constraint(equalTo: myView2.bottomAnchor, constant: 0),
                                     myView3.leadingAnchor.constraint(equalTo: myView1.leadingAnchor, constant: 0),
                                     myView3.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
                                     myView3.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4)])
        
        NSLayoutConstraint.activate([myView4.topAnchor.constraint(equalTo: myView3.bottomAnchor, constant: 0),
                                     myView4.leadingAnchor.constraint(equalTo: myView2.leadingAnchor, constant: 0),
                                     myView4.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
                                     myView4.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height / 4)])

    }
    
    // 바둑알 생성
    let myView1: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 4)))
        
        view.backgroundColor = .yellow
        view.clipsToBounds = true
        return view
    }()
    
    let myView2: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 4)))
        
        view.backgroundColor = .green
        view.clipsToBounds = true
        return view
    }()
    
    let myView3: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 4)))
        
        view.backgroundColor = .black
        view.clipsToBounds = true
        return view
    }()
    
    let myView4: UIView = {
        let view = UIView(frame: .init(origin: .zero, size: .init(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.height / 4)))
        
        view.backgroundColor = .blue
        view.clipsToBounds = true
        return view
    }()

}

