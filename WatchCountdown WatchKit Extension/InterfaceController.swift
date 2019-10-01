//
//  InterfaceController.swift
//  Watch Extension
//
//  Created by Tamara on 25/09/2019.
//  Copyright © 2019 Tamara. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var table: WKInterfaceTable!
    
    var events = Event.allEvents()
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        table.setNumberOfRows(events.count, withRowType: "EventRow")
        
        for index in 0..<table.numberOfRows {
          guard let controller = table.rowController(at: index) as? EventRowController else { continue }

          controller.event = events[index]
        }
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        let event = events[rowIndex]
        pushController(withName: "Event", context: event)
    }

}
