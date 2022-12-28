//
//  ViewController.swift
//  RotationSample

import UIKit

class ViewControllerB: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.isFullScreen = true
        }
    }
    
    @IBAction func rotateAction(_ sender: Any) {
        if #available(iOS 16.0, *) {
            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                windowScene.requestGeometryUpdate(.iOS(interfaceOrientations: windowScene.interfaceOrientation.isPortrait ? .landscape : .portrait)) {
                    error in
                    print(error)
                }
            }
            self.setNeedsUpdateOfSupportedInterfaceOrientations()
        } else {
            let mask: UIDeviceOrientation = UIApplication.shared.statusBarOrientation == .portrait ? .landscapeLeft : .portrait
            UIDevice.current.setValue(mask.rawValue, forKey: "orientation")
        }

    }

    @IBAction func closeAction(_ sender: Any) {
        if let delegate = UIApplication.shared.delegate as? AppDelegate {
            delegate.isFullScreen = false
        }
        self.dismiss(animated: true)
    }

}

