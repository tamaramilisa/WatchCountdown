//
//  EventInterfaceController.swift
//  Watch Extension
//
//  Created by Tamara on 25/09/2019.
//  Copyright © 2019 Tamara. All rights reserved.
//

import Foundation
import WatchKit

class EventInterfaceController: WKInterfaceController {
    
    @IBOutlet var eventImage: WKInterfaceImage!
    @IBOutlet var nameLabel: WKInterfaceLabel!
    @IBOutlet var timer: WKInterfaceTimer!
    @IBOutlet var categoryLabel: WKInterfaceLabel!
    
    var event: Event? {
      didSet {
        guard let event = event else { return }

        nameLabel.setText(event.name)
        categoryLabel.setText(event.category?.rawValue)
        eventImage.setImage(event.category?.eventImage)
        
        setupTimer()
        }
    }
    
    override func awake(withContext context: Any?) {
      super.awake(withContext: context)

      if let event = context as? Event {
        self.event = event
      }
    }
    
    private func setupTimer() {
        timer.setDate(event?.endDate ?? Date())
        timer.start()
    }
    
    private func updateImageColor() {
        eventImage.setTintColor(event?.category?.eventColor)
        categoryLabel.setTextColor(event?.category?.eventColor)
    }
    
    override func didAppear() {
        super.didAppear()
        
        animate(withDuration: 0.4) {
            self.updateImageColor()
        }
    }
}
