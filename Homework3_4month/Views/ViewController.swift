//
//  ViewController.swift
//  Homework3_4month
//
//  Created by Бектур Каримов on 3/4/23.
//

import UIKit
import SnapKit
import Kingfisher

class ViewController: UIViewController {
    private var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "1")
        return image
    }()

    private lazy var label: UILabel = {
        let label = UILabel()
        label.tintColor = .black
        label.textColor = .black
        label.text = "Choose button:"
        return label
    }()
    private lazy var label1: UILabel = {
        let label = UILabel()
        label.tintColor = .black
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "For News:"
        return label
    }()
    private lazy var label2: UILabel = {
        let label = UILabel()
        label.tintColor = .black
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "For posting news:"
        return label
    }()

    
    
    private lazy var getRequest: UIButton = {
        let get = UIButton(type: .system)
        get.setTitle("Get Request", for: .normal)
        get.backgroundColor = .blue
        get.setTitleColor(.white , for: .normal)
        get.layer.cornerRadius = 10
        get.addTarget(self, action: #selector(getRequast(sender: )), for: .touchUpInside)
        return get
    }()
    private lazy var postRequest: UIButton = {
        let post = UIButton(type: .system)
        post.setTitle("Post Request", for: .normal)
        post.setTitleColor(.white, for: .normal)
        post.backgroundColor = .blue
        post.layer.cornerRadius = 10
        post.addTarget(self, action: #selector(postRequast(sender: )), for: .touchUpInside)
        return post
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setupConstraints()
        view.backgroundColor = .white
        
    }
   
    func setupConstraints() {
        view.addSubview(image)
        image.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.left.right.equalToSuperview().inset(150)
            make.height.equalTo(100)
            make.width.equalTo(150)
        }
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(300)
            make.left.equalTo(140)
            make.width.equalTo(300)
            make.height.equalTo(50)
        }
        
        view.addSubview(label1)
        label1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(350)
            make.left.equalTo(50)
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        view.addSubview(label2)
        label2.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(450)
            make.left.equalTo(50)
            make.width.equalTo(200)
            make.height.equalTo(30)
        }
        view.addSubview(getRequest)
        getRequest.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(400)
            make.centerY.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(300)
        }
        view.addSubview(postRequest)
        postRequest.snp.makeConstraints { make in
            make.top.equalTo(getRequest.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(300)
        }
        
    }
    @objc private func getRequast(sender:UIButton){
        ApiManager.shared.getRequest { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let vc = GetRequestPage()
                    vc.data = data.products ?? []
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @objc private func postRequast(sender: UIButton){
        
            navigationController?.pushViewController(PostRequestPage(), animated: true)
        
    }
}

