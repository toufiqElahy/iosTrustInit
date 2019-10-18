// Copyright DApps Platform Inc. All rights reserved.

import UIKit

class DexDetailView: UIView {

    @IBOutlet weak var payAmount: UITextField!
    @IBOutlet weak var receiveAmount: UITextField!
    @IBOutlet weak var payPresent: UILabel!
    @IBOutlet weak var receivePresent: UILabel!
    @IBOutlet weak var swapCurrType: UIButton!
    @IBOutlet weak var payCurrTypeImg: UIImageView!
    @IBOutlet weak var receiveCurrTypeImg: UIImageView!
    @IBOutlet weak var payCurrType: UILabel!
    @IBOutlet weak var receiveCurrType: UILabel!
    @IBOutlet weak var payCurrTypeChng: UIButton!
    @IBOutlet weak var receiveCurrTypeChng: UIButton!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
