//
//  DetailViewController.swift
//  SalesFormZohoCreator
//
//  Created by Temp on 13/03/22.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {

    var salesReport: Order?
    
    var index: IndexPath?
    
    let contentView: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .white
        stack.axis = .vertical
        stack.spacing = 2
        stack.alignment = .center
        stack.distribution = .fillProportionally
        return stack
    }()
    
    lazy var imeField: UILabel = {
        let text = UILabel()
        text.backgroundColor = .white
        text.textColor = .black
        text.text = "IME : \((salesReport?.data[index!.row].IME)!)"
//        text.layer.borderWidth = 1.5
//        text.layer.borderColor = UIColor.tintColor.cgColor
        return text
    }()
    
    lazy var mobileBrand: UILabel = {
        let text = UILabel()
        text.backgroundColor = .white
        text.textColor = .black
        text.text = "Mobile Brand: \((salesReport?.data[index!.row].Mobile_Brand)!)"
        return text
    }()
    
    lazy var mobileModel: UILabel = {
        let text = UILabel()
        text.backgroundColor = .white
        text.textColor = .black
        text.text = "Mobile Model: \((salesReport?.data[index!.row].Mobile_Model)!)"
        return text
    }()
    
    lazy var price: UILabel = {
        let text = UILabel()
        text.backgroundColor = .white
        text.textColor = .black
        text.text = "Price : \((salesReport?.data[index!.row].Price)!)"
        return text
    }()
    
    lazy var employee: UILabel = {
        let text = UILabel()
        text.backgroundColor = .white
        text.textColor = .black
        text.text = "Saled By : \((salesReport?.data[index!.row].Employee)!)"
        return text
    }()
    
    lazy var date: UILabel = {
        let text = UILabel()
        text.backgroundColor = .white
        text.textColor = .black
        text.text = "Saled Date: \((salesReport?.data[index!.row].Saled_Date)!)"
        return text
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        layoutSubViews()
        
        navigationItem.title = salesReport?.data[index!.row].IME
    }
    
    
    
    func layoutSubViews(){
        view.addSubview(contentView)
        contentView.addArrangedSubview(imeField)
        contentView.addArrangedSubview(mobileBrand)
        contentView.addArrangedSubview(mobileModel)
        contentView.addArrangedSubview(price)
        contentView.addArrangedSubview(employee)
        contentView.addArrangedSubview(date)
        
        
        
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
        
        
    }
}
