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
    @IBOutlet weak var Open: UIBarButtonItem!
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    var addAssignmentButton = UIButton()
    
    var numberOfRows = 6
    let formatter = DateFormatter()
    var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    var generateInDates: InDateCellGeneration = .forAllMonths
    var generateOutDates: OutDateCellGeneration = .tillEndOfGrid
    let firstDayOfWeek: DaysOfWeek = .sunday
    let disabledColor = UIColor.lightGray
    let enabledColor = UIColor.blue
    let dateCellSize: CGFloat? = nil
    
    let thisMonthsDateColor = UIColor.orange
    let otherMonthsDateColor = UIColor.darkGray
    
    let thisSelectedMonthsDateColor = UIColor.white
    let otherSelectedMonthsDateColor = UIColor.black
    
    
    var headerText = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        Open.target = self.revealViewController()
        //Open.action = #selector(SWRevealViewController.revealToggle(_:))
        Open.action = Selector("revealToggle:")
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        
        Thread.sleep(forTimeInterval: 1)
        //The line above is if we want to increase the launchscreen time
        formatter.dateFormat = "yyyy MM dd"
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        
        //Setting up your dataSource and delegate is manditory
        
        calendarView.delegate = self
        calendarView.dataSource = self
        
        calendarView.registerCellViewXib(file: "CellView")
        
        calendarView.registerHeaderView(xibFileNames: ["SectionHeaderView1"])
        
        
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
        self.calendarView.dataSource = self
        self.calendarView.delegate = self
        calendarView.registerCellViewXib(file: "CellView") // Registering your cell is manditory
        calendarView.cellInset = CGPoint(x: 0, y: 0)
        
        let month = calendar.dateComponents([.month], from: startDate).month!
        let monthName = DateFormatter().monthSymbols[(month-1) % 12]
        // 0 indexed array
        let year = calendar.component(.year, from: startDate)
        
        //Change month label attributes here
        monthLabel.font = UIFont(name: "Avenir", size: 50)
        monthLabel.textColor = UIColor.white
        
        headerText = monthLabel.text!
        
        monthLabel.text = monthName + " " + String(year)
        
        
        
        
    }
    
}

// MARK : JTAppleCalendarDelegate
extension ViewController: JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource {
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        let startDate = formatter.date(from: "2016 11 09 ")!
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
        
        let customCell = cell as! CellView
        
        // Setup Cell text
        customCell.dayLabel.text = cellState.text
        
        // Setup text color
        if cellState.dateBelongsTo == .thisMonth {
            customCell.dayLabel.textColor = thisMonthsDateColor
        } else {
            customCell.dayLabel.textColor = otherMonthsDateColor
        }
        
        
        
        customCell.todayColor = UIColor.lightGray
        
        customCell.normalDayColor = UIColor.white
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleDayCellView?, cellState: CellState) {
        let customCell = cell as! CellView
        
        (cell as? CellView)?.cellSelectionChanged(cellState)
        
        
        // Setup Cell text
        customCell.dayLabel.text = cellState.text
        
        // Setup text color
        if cellState.dateBelongsTo == .thisMonth {
            customCell.dayLabel.textColor = thisSelectedMonthsDateColor
        } else {
            customCell.dayLabel.textColor = otherSelectedMonthsDateColor
        }
        
        //Gives rounded corners to selected view
        (cell as? CellView)?.selectedView.layer.cornerRadius = 30
        
        //Add assignment Button Code
        
        //Function for add assignment button
        func addButtonAction(sender: UIButton) {
            print("Add button pressed")
            let alertView = UIAlertView();
            alertView.addButton(withTitle: "OK");
            alertView.title = "Alert";
            alertView.message = "Button Pressed!!!";
            alertView.show();
        }
        
        addAssignmentButton.backgroundColor = UIColor.black
        addAssignmentButton.setTitle("Add Assignment", for: .normal)
        addAssignmentButton.addTarget(self, action: #selector(getter: ViewController.addAssignmentButton), for: .touchUpInside)
        addAssignmentButton.tag = 1
        self.view.addSubview(addAssignmentButton)
        
        
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleDayCellView?, cellState: CellState) {
        (cell as? CellView)?.cellSelectionChanged(cellState)
        
        let customCell = cell as! CellView
        
        // Setup Cell text
        customCell.dayLabel.text = cellState.text
        
        // Setup text color
        if cellState.dateBelongsTo == .thisMonth {
            customCell.dayLabel.textColor = thisMonthsDateColor
        } else {
            customCell.dayLabel.textColor = otherMonthsDateColor
        }
        
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .center
        label.text = "I'm a test label"
        
        if calendar.selectedDates.count == 1 {
            
            self.view.addSubview(label)
        }
        else {
            label.removeFromSuperview()
        }
        
        
    }
    
    
    //Function Not needed for iOS 10; will not be called
    func calendar(_ calendar: JTAppleCalendarView, willResetCell cell: JTAppleDayCellView) {
        (cell as? CellView)?.selectedView.isHidden = true
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        self.setupViewsOfCalendar(from: visibleDates)
    }
    
    func calendar(_ calendar: JTAppleCalendarView,
                  sectionHeaderIdentifierFor range: (start: Date, end: Date),
                  belongingTo month: Int) -> String {
        return "SectionHeaderView1"
    }
    
    func calendar(_ calendar: JTAppleCalendarView, sectionHeaderSizeFor range: (start: Date, end: Date), belongingTo month: Int) -> CGSize {
        return CGSize(width: 200, height: 50)
        
    }
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplaySectionHeader header: JTAppleHeaderView, range: (start: Date, end: Date), identifier: String) {
        
        let headerCell = header as? SectionHeaderView1
        headerCell?.title.text = "Sunday          Monday          Tuesday          Wednesday           Thursday         Friday          Saturday" //Change for iPad 3
        
        headerCell?.title.textColor = UIColor.white
        
    }
    
}

func delayRunOnMainThread(_ delay: Double, closure: @escaping () -> ()) {
    DispatchQueue.main.asyncAfter(
        deadline: DispatchTime.now() +
            Double(Int64(delay * Double(NSEC_PER_SEC))) /
            Double(NSEC_PER_SEC), execute: closure)
}

