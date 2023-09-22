////
////  SettingsViewModelTests.swift
////  MVVMPracticeTests
////
////  Created by jiweon.lee on 2023/09/26.
////
//
//import XCTest
//@testable import MVVMPractice
//
//class SettingsViewModelTests: XCTestCase {
//
//    private var settingsVM: SettingsViewModel!
//    
//    override func setUp() {
//        super.setUp()
//        
//        self.settingsVM = SettingsViewModel()
//    }
//    
//    func test_should_return_correct_display_name_for_fahrenheit() {
//        XCTAssertEqual(self.settingsVM.selectedUnit.displayName, "Fahrenheit")
//    }
//    
//    func test_should_make_sure_that_default_seleted_unit_is_fahrenheit() {
//        XCTAssertEqual(settingsVM.selectedUnit, .fahrenheit)
//    }
//    
//    func test_should_be_able_to_save_user_unit_selection() {
//        self.settingsVM.selectedUnit = .celsius
//        let userDefaults = UserDefaults.standard
//        XCTAssertNotNil(userDefaults.value(forKey: "unit"))
//    }
//    
//    override class func tearDown() {
//        super.tearDown()
//        
//        let userDefaults = UserDefaults.standard
//        userDefaults.removeObject(forKey: "unit")
//    }
//}
