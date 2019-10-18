// Copyright DApps Platform Inc. All rights reserved.

import UIKit

final class DexViewController: UIViewController, Coordinator {
    var coordinators: [Coordinator] = []
    
    lazy var dexDetailView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.layer.shadowRadius = 3
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var dexPayView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var dexReceiveView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var pay_label: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 20))
        label.text = "You Pay"
        label.textColor = .gray
        label.font = UIFont(name: "family", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var receive_label: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 20))
        label.text = "You Receive"
        label.textColor = .gray
        label.font = UIFont(name: "family", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var pay_present: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 20))
        label.text = "0.00"
        label.textColor = .gray
        label.font = UIFont(name: "family", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var receive_present: UILabel = {
        let label = UILabel()
        label.text = "0.00"
        label.textColor = .gray
        label.font = UIFont(name: "family", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var pay_amount: UITextField = {
        let txtField = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 20))
        txtField.borderStyle = .none
        txtField.placeholder = "0"
        txtField.font = txtField.font?.withSize(25)
        txtField.translatesAutoresizingMaskIntoConstraints = false
        return txtField
    }()
    
    var receive_amount: UITextField = {
        let txtField = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 20))
        txtField.borderStyle = .none
        txtField.placeholder = "0"
        txtField.font = txtField.font?.withSize(25)
        txtField.translatesAutoresizingMaskIntoConstraints = false
        return txtField
    }()
    
    var btnSwap: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "change_img.png"), for: .normal)
        btn.backgroundColor = .white
        btn.layer.cornerRadius = 15
        btn.layer.borderWidth = 0.5
        btn.layer.borderColor = UIColor.black.cgColor
        btn.clipsToBounds = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var detail_label: UILabel = {
        let label = UILabel()
        label.text = "1 MITH ~ 0.00138978 BNB"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var pay_currtype_img: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "change_img.png")
        img.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var receive_currtype_img: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "change_img.png")
        img.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    var pay_currtype_label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "BNB"
        return label
    }()
    
    var receive_currtype_label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "MITH"
        return label
    }()
    
    var btn_p_chng: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "right_arrow_img"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var btn_r_chng: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "right_arrow_img"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var btnNext: UIButton = {
        
        let btn = Button(size: .normal, style: .solid)
        btn.setTitle("NEXT", for: .normal)
        
        btn.layer.shadowColor = UIColor.gray.cgColor
        btn.layer.shadowOpacity = 1
        btn.layer.shadowOffset = .zero
        btn.layer.shadowRadius = 3
        btn.clipsToBounds = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        dexDetailView.addSubview(pay_label)
        dexDetailView.addSubview(pay_amount)
        dexDetailView.addSubview(pay_present)
        
        var sep1_view: UIView = {
            let view = UIView()
            view.backgroundColor = .gray
            view.translatesAutoresizingMaskIntoConstraints = false
            return view;
        }()
        dexDetailView.addSubview(sep1_view)
        
        sep1_view.leftAnchor.constraint(equalTo: dexDetailView.leftAnchor).isActive = true
        sep1_view.rightAnchor.constraint(equalTo: dexDetailView.rightAnchor).isActive = true
        sep1_view.centerYAnchor.constraint(equalTo: dexDetailView.centerYAnchor).isActive = true
        sep1_view.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        dexDetailView.addSubview(btnSwap)
        
        dexDetailView.addSubview(receive_label)
        dexDetailView.addSubview(receive_amount)
        dexDetailView.addSubview(receive_present)

        pay_label.leftAnchor.constraint(equalTo: dexDetailView.leftAnchor, constant: 20).isActive = true
        pay_label.topAnchor.constraint(equalTo: dexDetailView.topAnchor, constant: 20).isActive = true
        pay_amount.leftAnchor.constraint(equalTo: dexDetailView.leftAnchor, constant: 20).isActive = true
        pay_amount.topAnchor.constraint(equalTo: pay_label.bottomAnchor, constant: 20).isActive = true
        pay_amount.rightAnchor.constraint(equalTo: btnSwap.rightAnchor, constant: -10).isActive = true
        
        pay_present.leftAnchor.constraint(equalTo: dexDetailView.leftAnchor, constant: 20).isActive = true
        pay_present.topAnchor.constraint(equalTo: pay_amount.bottomAnchor, constant: 20).isActive = true
        
        receive_label.leftAnchor.constraint(equalTo: dexDetailView.leftAnchor, constant: 20).isActive = true
        receive_label.topAnchor.constraint(equalTo: dexDetailView.centerYAnchor, constant: 20).isActive = true
        receive_amount.leftAnchor.constraint(equalTo: dexDetailView.leftAnchor, constant: 20).isActive = true
        receive_amount.topAnchor.constraint(equalTo: receive_label.bottomAnchor, constant: 20).isActive = true
        receive_amount.rightAnchor.constraint(equalTo: btnSwap.rightAnchor, constant: -10).isActive = true
        receive_present.leftAnchor.constraint(equalTo: dexDetailView.leftAnchor, constant: 20).isActive = true
        receive_present.topAnchor.constraint(equalTo: receive_amount.bottomAnchor, constant: 20).isActive = true

        btnSwap.widthAnchor.constraint(equalToConstant: 30).isActive = true
        btnSwap.heightAnchor.constraint(equalToConstant: 30).isActive = true
        btnSwap.centerXAnchor.constraint(equalTo: dexDetailView.centerXAnchor, constant: 25).isActive = true
        btnSwap.centerYAnchor.constraint(equalTo: dexDetailView.centerYAnchor).isActive = true

        view.addSubview(dexDetailView)

        dexDetailView.leftAnchor.constraint(equalTo:view.leftAnchor, constant: 20).isActive = true
        dexDetailView.rightAnchor.constraint(equalTo:view.rightAnchor, constant: -20).isActive = true
        dexDetailView.bottomAnchor.constraint(equalTo: receive_present.bottomAnchor, constant: 20).isActive = true
        dexDetailView.topAnchor.constraint(equalTo:view.topAnchor, constant: 105).isActive = true
        
        view.addSubview(detail_label)
        
        detail_label.leftAnchor.constraint(equalTo: dexDetailView.leftAnchor).isActive = true
        detail_label.topAnchor.constraint(equalTo: dexDetailView.bottomAnchor, constant: 20).isActive = true
        
        view.addSubview(btnNext)
        
        btnNext.leftAnchor.constraint(equalTo: dexDetailView.leftAnchor).isActive = true
        btnNext.rightAnchor.constraint(equalTo: dexDetailView.rightAnchor).isActive = true
        btnNext.topAnchor.constraint(equalTo: detail_label.bottomAnchor, constant: 20).isActive = true
        btnNext.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        view.addSubview(pay_currtype_img)
        view.addSubview(pay_currtype_label)
        view.addSubview(btn_p_chng)
        
        pay_currtype_img.centerYAnchor.constraint(equalTo: pay_amount.centerYAnchor).isActive = true
        pay_currtype_img.leftAnchor.constraint(equalTo: btnSwap.rightAnchor, constant: 20).isActive = true
        pay_currtype_img.heightAnchor.constraint(equalToConstant: 20).isActive = true
        pay_currtype_img.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        pay_currtype_label.centerYAnchor.constraint(equalTo: pay_amount.centerYAnchor).isActive = true
        pay_currtype_label.leftAnchor.constraint(equalTo: pay_currtype_img.rightAnchor, constant: 20).isActive = true
        
        btn_p_chng.centerYAnchor.constraint(equalTo: pay_amount.centerYAnchor).isActive = true
        btn_p_chng.leftAnchor.constraint(equalTo: pay_currtype_label.rightAnchor, constant: 20).isActive = true
        btn_p_chng.heightAnchor.constraint(equalToConstant: 20).isActive = true
        btn_p_chng.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        view.addSubview(receive_currtype_img)
        view.addSubview(receive_currtype_label)
        view.addSubview(btn_r_chng)
        
        receive_currtype_img.centerYAnchor.constraint(equalTo: receive_amount.centerYAnchor).isActive = true
        receive_currtype_img.leftAnchor.constraint(equalTo: btnSwap.rightAnchor, constant: 20).isActive = true
        receive_currtype_img.heightAnchor.constraint(equalToConstant: 20).isActive = true
        receive_currtype_img.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
        receive_currtype_label.centerYAnchor.constraint(equalTo: receive_amount.centerYAnchor).isActive = true
        receive_currtype_label.leftAnchor.constraint(equalTo: receive_currtype_img.rightAnchor, constant: 20).isActive = true
        
        btn_r_chng.centerYAnchor.constraint(equalTo: receive_amount.centerYAnchor).isActive = true
        btn_r_chng.leftAnchor.constraint(equalTo: receive_currtype_label.rightAnchor, constant: 20).isActive = true
        btn_r_chng.heightAnchor.constraint(equalToConstant: 20).isActive = true
        btn_r_chng.widthAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
}
