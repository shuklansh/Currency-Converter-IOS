//
//  CurrencyTip.swift
//  TestApp
//
//  Created by www.abcom.in on 03/04/24.
//

import Foundation
import TipKit

struct CurrencyTip: Tip {
    var title: Text = Text("Change currency ")
    
    var message: Text? = Text("You can click on left or right currency to bring up the Select Currency screen ")
    
}
