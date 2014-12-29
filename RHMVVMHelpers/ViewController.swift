//
//  ViewController.swift
//  RHMVVMHelpers
//
//  Created by Retso Huang on 12/29/14.
//  Copyright (c) 2014 Retso Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // MARK: - Layout
  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var secondLabel: UILabel!
  
  // MARK: - Variable
  var text = Dynamic("")

  override func viewDidLoad() {
    super.viewDidLoad()
    
    /**
    *  Binding with text variable and set value
    */
    self.text.bindAndFire {
      self.label.text = $0
    }
    
    /**
    *  Binding with text variable
    */
    self.text.bind {
      self.secondLabel.text = $0
    }
    
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }

  // MAKR: - User Control Event
  @IBAction func textFieldEditingChanged(sender: UITextField) {
    self.text.value = sender.text
  }
}

