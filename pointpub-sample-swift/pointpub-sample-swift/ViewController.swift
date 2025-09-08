//
//  ViewController.swift
//  pointpub-sample-swift
//
//  Created by choiseungmyeong on 9/8/25.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - UI Components
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var getVirtualPointButton: UIButton!
    @IBOutlet weak var spendVirtualPointButton: UIButton!
    @IBOutlet weak var getCampaignButton: UIButton!
    
    // MARK: - Properties
    
    let defaultValue = "123456789"
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapView))
        view.addGestureRecognizer(tapGesture)
        
        enterButton.layer.cornerRadius = 12
        getVirtualPointButton.layer.cornerRadius = 12
        spendVirtualPointButton.layer.cornerRadius = 12
        getCampaignButton.layer.cornerRadius = 12
    }
    
    // MARK: - Action
    
    @objc
    private func didTapView(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func didTapEnterButton(_ sender: Any) {
        print(#function)
    }
    
    @IBAction func didTapGetVirtualPoint(_ sender: Any) {
        print(#function)
    }
    
    @IBAction func didTapSpendVirtualPoint(_ sender: Any) {
        print(#function)
    }
    
    @IBAction func didTapGetCompletedCampaign(_ sender: Any) {
        print(#function)
    }
}

// MARK: - PointPubDelegate

//extension ViewController: PointPubDelegate {
//    func onOpenOfferwall() {
//        print(#function)
//    }
//    
//    func onCloseOfferwall() {
//        print(#function)
//    }
//}
