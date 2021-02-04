//
//  PresetViewController.swift
//  meditation
//
//  Created by Timo Metsälä on 4.2.2021.
//

import UIKit
import SnapKit

class PresetViewController: UIViewController {
    let preset: Int

    init(preset: Int) {
        self.preset = preset
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Preset \(preset)"
        
        let preset = PresetView()
        view.addSubview(preset)
        
        preset.snp.makeConstraints { (make) in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}
