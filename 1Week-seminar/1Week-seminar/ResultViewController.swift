//
//  ResultViewController.swift
//  1Week-seminar
//
//  Created by yeonsu on 10/7/23.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    
    var delegate: GetDataProtocol?
    
    var email: String = ""
    var password: String = ""
    
    
    // 클로저
    var loginDataCompletion: (([String]) -> Void)? //스트링 타입의 배열을 매개변수로 전달 할거고, 리턴타입은 void다!

    private func bindText() {
        self.emailLabel.text = "\(email)"
        self.passwordLabel.text = "\(password)"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bindText()
    }
    
    
    @IBAction func backButtonDidTapped(_ sender: Any) {
        
        // 네비게이션 컨트롤러 유무에 따른 분기 처리
        if let navigationController = self.navigationController {
            navigationController.popViewController(animated: true)
        } else {
            self.dismiss(animated: true)
        }
        
        /* 델리게이트
        delegate?.getLoginData(email: self.email,
                                       password: self.password) */
        
        guard let loginDataCompletion else {return}
                loginDataCompletion([self.email, self.password])
    }
    
    func setLabelText(id: String,
                          password: String) {
        self.email = id
        self.password = password
    }
    
}
