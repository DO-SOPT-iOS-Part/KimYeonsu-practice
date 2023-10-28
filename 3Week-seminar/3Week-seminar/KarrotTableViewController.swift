//
//  KarrotTableViewController.swift
//  3Week-seminar
//
//  Created by yeonsu on 10/28/23.
//

import UIKit

class KarrotTableViewController: UIViewController {
    
    // 테이블뷰 객체 생성
    private let tableView = UITableView(frame: .zero, style: .plain).then {
        $0.backgroundColor = .init(red: 33.0 / 255.0,
                                   green: 33.0 / 255.0,
                                   blue: 33.0 / 255.0,
                                   alpha: 1.0)
        $0.separatorColor = .lightGray  // cell 사이를 구분하는 선
        $0.separatorStyle = .singleLine
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLayout()
        setTableViewConfig()
    }
    
    // 테이블뷰 레이아웃 설정
    private func setLayout() {
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // 테이블뷰에 동적 cell 추가
    private func setTableViewConfig() {
        self.tableView.register(ItemListTableViewCell.self,
                                forCellReuseIdentifier: ItemListTableViewCell.identifier)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    
    
}

// 테이블뷰 필수 메서드 구현
extension KarrotTableViewController: UITableViewDelegate {}

extension KarrotTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return itemListData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemListTableViewCell.identifier,
                                                       for: indexPath) as? ItemListTableViewCell else {return UITableViewCell()}
        
        // cell 값 변경 시 실제 데이터에 적용 안 되는 이슈 해결
        cell.likeTapCompletion = { [weak self] state in
            guard let self else { return }
            itemListData[indexPath.row].isLike = state
        }
        cell.bindData(data: itemListData[indexPath.row])
        
        return cell
    }
}
