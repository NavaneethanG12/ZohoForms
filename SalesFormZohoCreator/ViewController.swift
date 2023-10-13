//
//  ViewController.swift
//  SalesFormZohoCreator
//
//  Created by Temp on 13/03/22.
//

import UIKit
import SnapKit


let authToken = "1000.41c0a4546088c6c04e5dc210af892c73.3e5d8aa7a77b87d53cd80427820a3154"


class ViewController: UIViewController {
    
    
    let postUrlString = "https://creator.zoho.in/api/v2/navanee/learningapp/form/sampleForm"
    
    
    let contentView: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .red
        stack.axis = .vertical
        stack.spacing = 2
        stack.alignment = .center
        stack.distribution = .fillProportionally
        return stack
    }()
    
    let imeField: UITextField = {
        let text = UITextField()
        text.placeholder = " IME NUMBER"
        text.backgroundColor = .white
        text.layer.borderWidth = 1.5
        text.layer.borderColor = UIColor.tintColor.cgColor
        return text
    }()
    
    let mobileBrand: UITextField = {
        let text = UITextField()
        text.placeholder = " Mobile Brand"
        text.backgroundColor = .white
        text.layer.borderWidth = 1.5
        text.layer.borderColor = UIColor.tintColor.cgColor
        return text
    }()
    
    let mobileModel: UITextField = {
        let text = UITextField()
        text.placeholder = " Mobile Model"
        text.backgroundColor = .white
        text.layer.borderWidth = 1.5
        text.layer.borderColor = UIColor.tintColor.cgColor
        return text
    }()
    
    let price: UITextField = {
        let text = UITextField()
        text.placeholder = " Price"
        text.backgroundColor = .white
        text.layer.borderWidth = 1.5
        text.layer.borderColor = UIColor.tintColor.cgColor
        return text
    }()
    
    let employee: UITextField = {
        let text = UITextField()
        text.placeholder = " Employee"
        text.backgroundColor = .white
        text.layer.borderWidth = 1.5
        text.layer.borderColor = UIColor.tintColor.cgColor
        return text
    }()
    
    let date: UITextField = {
        let text = UITextField()
        text.placeholder = " Eg: 04-Mar-2022"
        text.backgroundColor = .white
        text.layer.borderWidth = 1.5
        text.layer.borderColor = UIColor.tintColor.cgColor
        return text
    }()
    
    let dummyView = UIView()
    
    lazy var submit: UIButton = {
        let button = UIButton()
        button.backgroundColor = .tintColor
        button.layer.cornerRadius = 10
        button.setTitle("Submit", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(submitHandler), for: .touchUpInside)
        return button
    }()
//
//    let contentView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .yellow
//        return view
//    }()
    
    
    lazy var contentScroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .blue
        scroll.isScrollEnabled = true
        return scroll
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Sales Form"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(rightBarButtonHandler))
        
        
        layoutsSubViews()

    }
    
    @objc func rightBarButtonHandler(){
        
        let vc = ReportTableViewController()
        
        navigationController?.pushViewController(vc, animated: true)
        
    }

    func layoutsSubViews(){
//        view.addSubview(contentScroll)
//        contentScroll.addSubview(contentStack)
//        contentStack.addArrangedSubview(contentView)
//
//        contentScroll.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide)
//            make.left.equalTo(view.safeAreaLayoutGuide)
//            make.right.equalTo(view.safeAreaLayoutGuide)
//            make.bottom.equalTo(view.safeAreaLayoutGuide)
//        }
//
//        contentStack.snp.makeConstraints { make in
//            make.top.equalTo(contentScroll)
//            make.bottom.equalTo(contentScroll)
//            make.left.equalTo(contentScroll)
//            make.right.equalTo(contentScroll)
//            make.width.equalTo(contentScroll)
//
//        }
        
        view.addSubview(contentView)
        contentView.addArrangedSubview(imeField)
        contentView.addArrangedSubview(mobileBrand)
        contentView.addArrangedSubview(mobileModel)
        contentView.addArrangedSubview(price)
        contentView.addArrangedSubview(employee)
        contentView.addArrangedSubview(date)
        contentView.addArrangedSubview(dummyView)
        contentView.addArrangedSubview(submit)
        
        
        contentView.snp.makeConstraints { make in
            make.height.equalTo(350)
            make.width.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(15)
        }
       
        imeField.snp.makeConstraints { make in
            make.height.equalTo(35)
            make.width.equalTo(contentView).offset(-10)
        }
        
        mobileModel.snp.makeConstraints { make in
            make.height.equalTo(35)
            make.width.equalTo(contentView).offset(-10)
        }
        
        mobileBrand.snp.makeConstraints { make in
            make.height.equalTo(35)
            make.width.equalTo(contentView).offset(-10)
        }
        
        price.snp.makeConstraints { make in
            make.height.equalTo(35)
            make.width.equalTo(contentView).offset(-10)
        }
        
        employee.snp.makeConstraints { make in
            make.height.equalTo(35)
            make.width.equalTo(contentView).offset(-10)
        }
        
        date.snp.makeConstraints { make in
            make.height.equalTo(35)
            make.width.equalTo(contentView).offset(-10)
        }
        
        dummyView.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.width.equalTo(contentView).offset(-10)
        }
        
        submit.snp.makeConstraints { make in
            make.height.equalTo(35)
            make.width.equalTo(contentView).offset(-75)
        }
        
    }
    
    
    @objc func submitHandler(_ sender: UIButton){
        
        guard let emi = imeField.text, let brand = mobileBrand.text, let model = mobileModel.text, let price = price.text, let employee = employee.text, let date = date.text else { return }
        
       
        let sale1 = Sale(IME: emi, Saled_Date: date, Employee: employee, Mobile_Model: model, Mobile_Brand: brand, Price: price)
        
        let order = Order(data: [sale1])
        let jsonEncoder = JSONEncoder()
        do {
            let body = try jsonEncoder.encode(order)
            
            if let url = URL(string: postUrlString){

                var request = URLRequest(url: url)
                request.httpMethod = "POST"
                request.setValue("Zoho-oauthtoken \(authToken)", forHTTPHeaderField: "Authorization")
                request.httpBody = body
                
                let task = URLSession.shared.dataTask(with: request) { data, reponse, error in
                    
                    if error != nil{
                        print("Error occured",error?.localizedDescription)
                    }
                    
                    if let reponse = reponse{
//                        print(reponse)
                    }
                    if let data = data {
                        print("Success")
                        print(String(data: data, encoding: .utf8)!)
                        DispatchQueue.main.async {
                            self.clearFields()
                        }
                        
                    }
                    
                    }
                    
                task.resume()
            }
            
        }catch{
            // Error while encoding json
            
            print("error while encoding json")
        }

    }

    func clearFields(){
        imeField.text = nil
        mobileBrand.text = nil
        mobileModel.text = nil
        price.text = nil
        employee.text = nil
        date.text = nil
    }
    
    
}

