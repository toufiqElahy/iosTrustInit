// Copyright DApps Platform Inc. All rights reserved.

import UIKit


class CurrTypeTableViewCell: UITableViewCell {
    
    let imgCurrType = UIImageView()
    let labCurrTypeName = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        imgCurrType.frame = CGRect(x: 0, y: 0, width: 45, height: 45)
        imgCurrType.image = UIImage(named: "change_img.png")
        
        imgCurrType.translatesAutoresizingMaskIntoConstraints = false
        imgCurrType.layer.borderColor = UIColor.darkGray.cgColor
        imgCurrType.layer.borderWidth = 0.5
        labCurrTypeName.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(imgCurrType)
        contentView.addSubview(labCurrTypeName)
        
        
        
        imgCurrType.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 25).isActive = true
        imgCurrType.widthAnchor.constraint(equalToConstant: 45).isActive = true
        imgCurrType.heightAnchor.constraint(equalToConstant: 45).isActive = true
        imgCurrType.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        labCurrTypeName.leftAnchor.constraint(equalTo: imgCurrType.rightAnchor, constant: 20).isActive = true
        labCurrTypeName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
                
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
