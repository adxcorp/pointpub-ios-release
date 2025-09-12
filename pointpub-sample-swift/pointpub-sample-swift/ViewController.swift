//
//  ViewController.swift
//  pointpub-sample-swift
//
//  Created by neptune on 9/8/25.
//

import UIKit
import PointPubSDK

class ViewController: UIViewController {
    
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var getVirtualPointButton: UIButton!
    @IBOutlet weak var spendVirtualPointButton: UIButton!
    @IBOutlet weak var getCampaignButton: UIButton!
    
    // let appId = "<ENTER YOUR APP ID>"
    private final let appId = "APP_17569663893761798"
    // let appId = "<ENTER YOUR USER ID>"
    private final let userId = "123456789"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapView))
        view.addGestureRecognizer(tapGesture)
        
        enterButton.layer.cornerRadius = 12
        getVirtualPointButton.layer.cornerRadius = 12
        spendVirtualPointButton.layer.cornerRadius = 12
        getCampaignButton.layer.cornerRadius = 12
        
        PointPub.delegate = self
        PointPub.setAppId(with: appId)
        PointPub.setUserId(with: userId)
        
        if !PointPub.isTrackingEnabled() {
            PointPub.requestTrackingPermission { isTrackingPermission in
                
            }
        }
    }
    
    @objc
    private func didTapView(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func didTapEnterButton(_ sender: Any) {
        PointPub.startOfferwall(from: self)
    }
    
    @IBAction func didTapGetVirtualPoint(_ sender: Any) {
        Task {
            do {
                let (pointName, point) = try await PointPub.getVirtualPoint()
                print("포인트명: \(pointName), 포인트 잔액: \(point)")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    @IBAction func didTapSpendVirtualPoint(_ sender: Any) {
        spendAllVirtualPointsIfAvailable()
    }
    
    private func spendAllVirtualPointsIfAvailable() {
        Task {
            do {
                let (pointName, remainingPoint) = try await PointPub.getVirtualPoint()
                print("포인트명: \(pointName), 포인트 잔액: \(remainingPoint)")
                    
                if remainingPoint > 0 {
                    spendVirtualPoint(amount: remainingPoint)
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }

    private func spendVirtualPoint(amount: Int) {
        Task {
            do {
                let (pointName, remainingPoint) = try await PointPub.spendVirtualPoint(point: amount)
                print("포인트명: \(pointName), 사용 후 포인트 잔액: \(remainingPoint)")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    @IBAction func didTapGetCompletedCampaign(_ sender: Any) {
        Task {
            do {
                let response = try await PointPub.getCompletedCampaign()
                print("\(response)")
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}

extension ViewController: PointPubDelegate {
    func onOpenOfferwall() {
        print(#function)
    }
    
    func onCloseOfferwall() {
        print(#function)
    }
}
