//
//  CellView.swift
//  testApplicationCalendar
//
//  Created by JayT on 2016-03-04.
//  Copyright © 2016 OS-Tech. All rights reserved.
//


import JTAppleCalendar

class CellView: JTAppleDayCellView {
    @IBInspectable var todayColor: UIColor!
    @IBInspectable var normalDayColor: UIColor!
    @IBOutlet var selectedView: AnimationView!
    @IBOutlet var dayLabel: UILabel!
    let textSelectedColor = UIColor.white
    let textDeselectedColor = UIColor.black
    let previousMonthTextColor = UIColor.gray
    
    lazy var todayDate: String = {
        [weak self] in
        let aString = self!.cal.string(from: Date())
        return aString
    }()
    
    
    lazy var cal: DateFormatter = {
        let fmtter = DateFormatter()
        fmtter.dateFormat = "yyyy-MM-dd"
        return fmtter
    }()
    
    func setupCellBeforeDisplay(_ cellState: CellState, date: Date) {
        // Setup Cell text
        
        dayLabel.text =  cellState.text
        
        // Setup text color
        configureTextColor(cellState)
        
        // Setup Cell Background color
        if cal.string(from: date) == todayDate {
            self.backgroundColor = todayColor
        }
        
        // Setup cell selection status
//        delayRunOnMainThread(0.0) {
            self.configueViewIntoBubbleView(cellState)
//        }
        // Configure Visibility
        configureVisibility(cellState)
        // With cell states you can literally control every aspect of the calendar view
        // Uncomment this code block to watch "JTAPPLE" spelt on the calendar

    }
    func configureVisibility(_ cellState: CellState) {
        if
            cellState.dateBelongsTo == .thisMonth ||
            cellState.dateBelongsTo == .previousMonthWithinBoundary ||
            cellState.dateBelongsTo == .followingMonthWithinBoundary {
            self.isHidden = false
        } else {
            self.isHidden = false
            
        }
    }
    func configureTextColor(_ cellState: CellState) {
        if cellState.isSelected {
            dayLabel.textColor = textSelectedColor
        } else if cellState.dateBelongsTo == .thisMonth {
            dayLabel.textColor = textDeselectedColor
        } else {
            dayLabel.textColor = previousMonthTextColor
        }
    }
    func cellSelectionChanged(_ cellState: CellState) {
        if cellState.isSelected == true {
            if selectedView.isHidden == true {
                configueViewIntoBubbleView(cellState)
//                selectedView.animateWithBounceEffect(withCompletionHandler: {
//                })
            }
        } else {
            configueViewIntoBubbleView(cellState, animateDeselection: true)
        }
    }
    fileprivate func configueViewIntoBubbleView(_ cellState: CellState, animateDeselection: Bool = false) {
        if cellState.isSelected {
//            self.selectedView.layer.cornerRadius =  self.selectedView.frame.width  / 2
            self.selectedView.isHidden = false
            configureTextColor(cellState)
        } else {
            if animateDeselection {
                configureTextColor(cellState)
                if selectedView.isHidden == false {
//                    selectedView.animateWithFadeEffect(withCompletionHandler: { () -> Void in
                        self.selectedView.isHidden = true
//                        self.selectedView.alpha = 1
//                    })
                }
            } else {
                selectedView.isHidden = true
            }
        }
        

        
    }
}

class AnimationView: UIView {
    func animateWithFlipEffect(withCompletionHandler completionHandler:(() -> Void)?) {
        AnimationClass.flipAnimation(self, completion: completionHandler)
    }
    func animateWithBounceEffect(withCompletionHandler completionHandler:(() -> Void)?) {
        let viewAnimation = AnimationClass.BounceEffect()
        viewAnimation(self) { _ in
            completionHandler?()
        }
    }
    func animateWithFadeEffect(withCompletionHandler completionHandler:(() -> Void)?) {
        let viewAnimation = AnimationClass.fadeOutEffect()
        viewAnimation(self) { _ in
            completionHandler?()
        }
    }
}

extension UIColor {
    convenience init(colorWithHexValue value: Int, alpha:CGFloat = 1.0){
        self.init(
            red: CGFloat((value & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((value & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(value & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}
