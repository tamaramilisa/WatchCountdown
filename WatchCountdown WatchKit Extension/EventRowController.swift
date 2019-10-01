//
//  EventRowContoller.swift
//  Watch Extension
//
//  Created by Tamara on 25/09/2019.
//  Copyright © 2019 Tamara. All rights reserved.
//

import WatchKit

class EventRowController: NSObject {

    @IBOutlet var separator: WKInterfaceSeparator!
    @IBOutlet var nameLabel: WKInterfaceLabel!
    @IBOutlet var eventImage: WKInterfaceImage!
    @IBOutlet var dateLabel: WKInterfaceLabel!
    
    var event: Event? {
        didSet {
            guard let event = event else { return }
            
            nameLabel.setText(event.name)
            separator.setColor(event.category?.eventColor)
            eventImage.setTintColor(event.category?.eventColor)
            eventImage.setImage(event.category?.eventImage)
            dateLabel.setText(event.endDateString)
        }
    }
    
}
