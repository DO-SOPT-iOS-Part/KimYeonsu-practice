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
    
    // 스택뷰 생성
    private var horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        
        return stackView
    }()
    
    private var verticalStackView1: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        
        return stackView
    }()
    
    private var verticalStackView2: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        
        return stackView
    }()
    
    private var yellowView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private var greenView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private var blackView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private var blueView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    private var whiteView1: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private var whiteView2: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private var whiteView3: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private var whiteView4: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    // 바둑판 생성
    private func setLayout() {
        // 스택뷰 레이아웃 생성
        self.view.addSubview(horizontalStackView)
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([horizontalStackView.topAnchor.constraint(equalTo: view.topAnchor),
                                     horizontalStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     horizontalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     horizontalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
        
        verticalStackView1.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView2.translatesAutoresizingMaskIntoConstraints = false
        
        verticalStackView1.addArrangedSubview(yellowView)
        verticalStackView1.addArrangedSubview(whiteView1)
        verticalStackView1.addArrangedSubview(blackView)
        verticalStackView1.addArrangedSubview(whiteView2)
        
        verticalStackView2.addArrangedSubview(whiteView3)
        verticalStackView2.addArrangedSubview(greenView)
        verticalStackView2.addArrangedSubview(whiteView4)
        verticalStackView2.addArrangedSubview(blueView)
        
        horizontalStackView.addArrangedSubview(verticalStackView1)
        horizontalStackView.addArrangedSubview(verticalStackView2)
    }
}
    
