//
//  PresetsViewController.swift
//  meditation
//
//  Created by Timo Metsälä on 1.2.2021.
//

import UIKit

class PresetsViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        let presetsView = PresetsView(openDetails: openPreset)
        view.addSubview(presetsView)
        presetsView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottomMargin)
            make.left.right.equalToSuperview()
        }
    }
    
    func openPreset(index: Int) {
        let presetViewController = PresetViewController(preset: index)
        self.navigationController?.pushViewController(presetViewController, animated: true)
    }

}
