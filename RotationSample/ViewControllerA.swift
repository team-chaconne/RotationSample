//
//  ViewController.swift
//  RotationSample

import UIKit

class ViewControllerA: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override var shouldAutorotate: Bool { true }
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask { .portrait }
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {.portrait }
    

    @IBAction func nextAction(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewControllerB") as? ViewControllerB {
            vc.modalPresentationStyle = .fullScreen
            self.present(vc,animated: true)
        }
    }
    
}

