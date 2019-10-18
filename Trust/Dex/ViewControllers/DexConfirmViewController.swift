// Copyright DApps Platform Inc. All rights reserved.

import UIKit

class DexConfirmViewController: UIViewController, Coordinator {
    var coordinators: [Coordinator] = []
    
    var header_label: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 20))
        label.text = "0 BNB => 0 MITH"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(25.0)
        return label
    }()
    
    var h_From: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 20))
        label.text = "From"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(17.0)
        return label
    }()
    
    var h_To: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 20))
        label.text = "To"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(17.0)
        return label
    }()
    
    var fee_label: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 20))
        label.text = "Network Fee"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(17.0)
        return label
    }()
    
    var detail_from: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 20))
        label.text = "Multi-Coin Wallet 1 (bnb1xrrn88s4...chqt3lw46w4t)"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(12.0)
        return label
    }()
    
    var detail_to: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 20))
        label.text = "bnb1xrrn88s4dwhp7lcj948s94hg92i0dschqt3lw46w4t"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(12.0)
        return label
    }()
    
    var detail_fee: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 20))
        label.text = "0.00005 BNB ($0.00117)"
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(17.0)
        return label
    }()
    
    var btnSend: UIButton = {
        
        let btn = Button(size: .normal, style: .solid)
        btn.setTitle("SEND", for: .normal)
        
        btn.layer.shadowColor = UIColor.gray.cgColor
        btn.layer.shadowOpacity = 1
        btn.layer.shadowOffset = .zero
        btn.layer.shadowRadius = 3
        
        //        btn.backgroundColor = .blue
        //        btn.tintColor = .white
        btn.clipsToBounds = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var fromView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var toView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var feeView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        headerView.addSubview(header_label)
        
        header_label.centerXAnchor.constraint(equalTo: headerView.centerXAnchor).isActive = true
        header_label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
        
        var sep1_view: UIView = {
            let view = UIView()
            view.backgroundColor = .gray
            view.translatesAutoresizingMaskIntoConstraints = false
            return view;
        }()
        
        view.addSubview(headerView)
        view.addSubview(sep1_view)
        
        headerView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        headerView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: view.frame.height/8).isActive = true
        headerView.topAnchor.constraint(equalTo:view.topAnchor, constant: 85).isActive = true
        
        sep1_view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        sep1_view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        sep1_view.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        sep1_view.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        fromView.addSubview(h_From)
        fromView.addSubview(detail_from)
        
        h_From.leftAnchor.constraint(equalTo: fromView.leftAnchor, constant: 15).isActive = true
        h_From.bottomAnchor.constraint(equalTo: fromView.centerYAnchor, constant: -3).isActive = true
        detail_from.leftAnchor.constraint(equalTo: fromView.leftAnchor, constant: 15).isActive = true
        detail_from.topAnchor.constraint(equalTo: fromView.centerYAnchor, constant: 3).isActive = true
        
        var sep2_view: UIView = {
            let view = UIView()
            view.backgroundColor = .gray
            view.translatesAutoresizingMaskIntoConstraints = false
            return view;
        }()
        
        view.addSubview(fromView)
        view.addSubview(sep2_view)
        
        fromView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        fromView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        fromView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 1).isActive = true
        fromView.heightAnchor.constraint(equalToConstant: view.frame.height/10).isActive = true
        
        sep2_view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        sep2_view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        sep2_view.topAnchor.constraint(equalTo: fromView.bottomAnchor).isActive = true
        sep2_view.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        toView.addSubview(h_To)
        toView.addSubview(detail_to)
        
        h_To.leftAnchor.constraint(equalTo: toView.leftAnchor, constant: 15).isActive = true
        h_To.bottomAnchor.constraint(equalTo: toView.centerYAnchor, constant: -3).isActive = true
        detail_to.leftAnchor.constraint(equalTo: toView.leftAnchor, constant: 15).isActive = true
        detail_to.topAnchor.constraint(equalTo: toView.centerYAnchor, constant: 3).isActive = true
        
        var sep3_view: UIView = {
            let view = UIView()
            view.backgroundColor = .gray
            view.translatesAutoresizingMaskIntoConstraints = false
            return view;
        }()
        
        view.addSubview(toView)
        view.addSubview(sep3_view)
        
        toView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        toView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        toView.topAnchor.constraint(equalTo: fromView.bottomAnchor, constant: 1).isActive = true
        toView.heightAnchor.constraint(equalToConstant: view.frame.height/10).isActive = true
        
        sep3_view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        sep3_view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        sep3_view.topAnchor.constraint(equalTo: toView.bottomAnchor).isActive = true
        sep3_view.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
        feeView.addSubview(fee_label)
        feeView.addSubview(detail_fee)
        
        fee_label.leftAnchor.constraint(equalTo: feeView.leftAnchor, constant: 15).isActive = true
        fee_label.centerYAnchor.constraint(equalTo: feeView.centerYAnchor).isActive = true
        detail_fee.rightAnchor.constraint(equalTo: feeView.rightAnchor, constant: -15).isActive = true
        detail_fee.centerYAnchor.constraint(equalTo: feeView.centerYAnchor).isActive = true
        
        var sep4_view: UIView = {
            let view = UIView()
            view.backgroundColor = .gray
            view.translatesAutoresizingMaskIntoConstraints = false
            return view;
        }()
        
        view.addSubview(feeView)
        view.addSubview(sep4_view)
        
        feeView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        feeView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        feeView.topAnchor.constraint(equalTo: toView.bottomAnchor, constant: 1).isActive = true
        feeView.heightAnchor.constraint(equalToConstant: view.frame.height/15).isActive = true
        
        sep4_view.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        sep4_view.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        sep4_view.topAnchor.constraint(equalTo: feeView.bottomAnchor).isActive = true
        sep4_view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
//        view.addSubview(header_label)
//        view.addSubview(h_From)
//        view.addSubview(detail_from)
//        view.addSubview(h_To)
//        view.addSubview(detail_to)
//        view.addSubview(fee_label)
//        view.addSubview(detail_fee)
        view.addSubview(btnSend)
        
//        header_label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btnSend.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
        btnSend.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        btnSend.widthAnchor.constraint(equalToConstant: view.frame.width - 20).isActive = true
        btnSend.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
}
