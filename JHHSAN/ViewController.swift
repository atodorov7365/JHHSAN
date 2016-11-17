//
//  ViewController.swift
//  JHHSAN
//
//  Created by student3 on 10/18/16.
//  Copyright © 2016 John Hersey High School. All rights reserved.
//

import UIKit
import JTAppleCalendar

class ViewController: UIViewController {
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    
    var numberOfRows = 6
    let formatter = DateFormatter()
    var testCalendar = Calendar(identifier: Calendar.Identifier.gregorian)
    var generateInDates: InDateCellGeneration = .forAllMonths
    var generateOutDates: OutDateCellGeneration = .tillEndOfGrid
    let firstDayOfWeek: DaysOfWeek = .sunday
    let disabledColor = UIColor.lightGray
    let enabledColor = UIColor.blue
    let dateCellSize: CGFloat? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Thread.sleep(forTimeInterval: 1)
        //The line above is if we want to increase the launchscreen time
        formatter.dateFormat = "yyyy MM dd"
        testCalendar.timeZone = TimeZone(secondsFromGMT: 0)!
        
        // Setting up your dataSource and delegate is manditory
        // ___________________________________________________________________
        calendarView.delegate = self
        calendarView.dataSource = self
        
        
        // ___________________________________________________________________
        // Registering your cells is manditory
        // ___________________________________________________________________
        calendarView.registerCellViewXib(file: "CellView")
        
        // ___________________________________________________________________
        // Registering your cells is optional
        // ___________________________________________________________________
        calendarView.registerHeaderView(xibFileNames: ["SectionHeaderView2", "SectionHeaderView1"])
        
        
        calendarView.cellInset = CGPoint(x: 0, y: 0)
        calendarView.allowsMultipleSelection = true
        
        calendarView.visibleDates { (visibleDates: DateSegmentInfo) in
            self.setupViewsOfCalendar(from: visibleDates)
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    func setupViewsOfCalendar(from visibleDates: DateSegmentInfo) {
        guard let startDate = visibleDates.monthDates.first else {
            return
        }
        let month = testCalendar.dateComponents([.month], from: startDate).month!
        let monthName = DateFormatter().monthSymbols[(month-1) % 12]
        // 0 indexed array
        let year = testCalendar.component(.year, from: startDate)
        
        //Change month label attributes here
        monthLabel.font = UIFont(name: "Avenir-light", size: 20)
        monthLabel.textColor = UIColor.black
        
        monthLabel.text = monthName + " " + String(year)
    }
    
}

// MARK : JTAppleCalendarDelegate
extension ViewController: JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource {
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        let startDate = formatter.date(from: "2016 01 01")!
        let endDate = formatter.date(from: "2020 12 30")!
        let parameters = ConfigurationParameters(
            startDate: startDate,
            endDate: endDate,
            numberOfRows: numberOfRows,
            //calendar: .gregorian,
            generateInDates: generateInDates,
            generateOutDates: generateOutDates,
            firstDayOfWeek: firstDayOfWeek
        )
        return parameters
    }
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplayCell cell: JTAppleDayCellView, date: Date, cellState: CellState) {
        (cell as? CellView)?.setupCellBeforeDisplay(cellState, date: date)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleDayCellView?, cellState: CellState) {
        (cell as? CellView)?.cellSelectionChanged(cellState)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleDayCellView?, cellState: CellState) {
        (cell as? CellView)?.cellSelectionChanged(cellState)
        
        //Gives rounded corners to selected view
        (cell as? CellView)?.selectedView.layer.cornerRadius = 30
    }
    
    
    // NOTICE: this function is not needed for iOS 10. It will not be called
    func calendar(_ calendar: JTAppleCalendarView, willResetCell cell: JTAppleDayCellView) {
        (cell as? CellView)?.selectedView.isHidden = true
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        self.setupViewsOfCalendar(from: visibleDates)
    }
    
    func calendar(_ calendar: JTAppleCalendarView,
                  sectionHeaderIdentifierFor range: (start: Date, end: Date),
                  belongingTo month: Int) -> String {
        if month % 2 > 0 {
            return "SectionHeaderView1"
        }
        return "SectionHeaderView2"
    }
    
    func calendar(_ calendar: JTAppleCalendarView, sectionHeaderSizeFor range: (start: Date, end: Date), belongingTo month: Int) -> CGSize {
        if month % 2 > 0 {
            return CGSize(width: 200, height: 50)
        } else {
            // Yes you can have different size headers
            return CGSize(width: 200, height: 50)
        }
    }
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplaySectionHeader header: JTAppleHeaderView, range: (start: Date, end: Date), identifier: String) {
        switch identifier {
        case "SectionHeaderView1":
            let headerCell = header as? SectionHeaderView1
            headerCell?.title.text = "Section Header 1"
        case "SectionHeaderView2":
            let headerCell = header as? SectionHeaderView2
            headerCell?.title.text = "Section Header 2"
        default:
            let headerCell = header as? SectionHeaderView2
            headerCell?.title.textColor = UIColor.black
        }
    }
    
}

func delayRunOnMainThread(_ delay: Double, closure: @escaping () -> ()) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() +
            Double(Int64(delay * Double(NSEC_PER_SEC))) /
            Double(NSEC_PER_SEC), execute: closure)
}

