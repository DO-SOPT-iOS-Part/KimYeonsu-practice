//
//  ViewController.swift
//  1Week-seminar
//
//  Created by yeonsu on 10/7/23.
//

import UIKit

class ViewController: UIViewController, GetDataProtocol {
    
    func getLoginData(email: String, password: String) {
        print("받아온 email: \(email), 받아온 password: \(password)")
    }
    
    
    var inputId: String = ""
    var inputPasswd: String = ""
    
    @IBAction func idTextFieldDidEditing(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
                if let inputId = textField.text {
                    self.inputId = inputId
                }
    }
    
    @IBAction func passwdTextFieldDidEditing(_ sender: Any) {
        guard let textField = sender as? UITextField else {return}
                if let inputPasswd = textField.text {
                    self.inputPasswd = inputPasswd
                }
    }
    
    
    @IBAction func loginButtonDidTapped(_ sender: Any) {
        print("아이디는 [\(inputId)] 비밀번호는 [\(inputPasswd)]")
        pushToResultVC4()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 화면 넘기기
    func pushToResultVC() {
        guard let resultVC = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController else {return}
        // self.navigationController?.pushViewController(resultVC, animated: true)
        self.present(resultVC, animated: true)
    }

    // 데이터+화면 넘기기
    func pushToResultVC2() {
        guard let resultVC = self.storyboard?.instantiateViewController(identifier: "ResultViewController") as? ResultViewController else {return}
        resultVC.email = inputId
        resultVC.password = inputPasswd
        self.navigationController?.pushViewController(resultVC, animated: true)
    }
    
    // 델리게이트 패턴(ResultVC -> VC)
    func pushToResultVC3() {
        guard let resultVC = self.storyboard?.instantiateViewController(identifier: "ResultViewController") as? ResultViewController else {return}
                resultVC.setLabelText(id: self.inputId,
                                      password: self.inputPasswd)
                resultVC.delegate = self
                self.navigationController?.pushViewController(resultVC, animated: true)
    }
    
    // 클로저(ResultVC -> VC)
    func pushToResultVC4() {
            guard let resultVC = self.storyboard?.instantiateViewController(identifier: "ResultViewController") as? ResultViewController else {return}
            resultVC.setLabelText(id: self.inputId,
                                  password: self.inputPasswd)
            self.navigationController?.pushViewController(resultVC, animated: true)
            resultVC.loginDataCompletion = { data in
                print("클로저로 받아온 email: \(data[0]), 클로저로 받아온 password: \(data[1])")
            }
    }

}

