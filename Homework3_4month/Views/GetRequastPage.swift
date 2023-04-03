//
//  GetRequestPage.swift
//  GetAndPostRequest
//
//  Created by Бексултан Мусаев on 31/3/23.
//

import UIKit
import SnapKit
import Kingfisher

class GetRequestPage: UIViewController {
    var data: [Product] = []
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = .white
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Some News"
//        view.backgroundColor
        setupTableViewConfigue()
        setupViewsConstraints()
    }
    
    private func setupTableViewConfigue() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        tableView.reloadData()
    }
    
    private func setupViewsConstraints() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension GetRequestPage: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CustomCell
        
        let value = data[indexPath.row]
        cell?.configure(with: value)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = GetRequestFullPage()
        vc.item = data[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
