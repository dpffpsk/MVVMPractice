//
//  BluetoothViewController.swift
//  MVVMPractice
//
//  Created by jiweon.lee on 2023/09/13.
//

import UIKit
import CoreBluetooth

class BluetoothViewController: UIViewController {

    var centralManager: CBCentralManager! // 블루투스 활성 상태 확인 및 실시간 블루투스 신호 스캔
    var peripheralManager: CBPeripheralManager! // 실시간 블루투스 신호 활성
    
    let sendBleLocal = "WONY" // 블루투스 신호 활성 시 사용 로컬 이름
    let sendBleUuid = CBUUID(string: "3B3C6A33-456F-42C0-9EEF-C04CBEF65D03") // 블루투스 신호 활성 시
    
    override func viewDidLoad() {
        super.viewDidLoad()

        /// centralManager은 블루투스 주변기기를 검색하고 연결하는 역할을 수행합니다.
//        centralManager = CBCentralManager(delegate: self, queue: nil)
        
        /// pendingPeripheral은 현재 연결을 시도하고 있는 블루투스 주변기기를 의미합니다.
//        peripheralManager = CBPeripheralManager(delegate: self, queue: nil)
        
        /// uuid
//        print("\(UIDevice.current.identifierForVendor!.uuidString)")
    }
}

extension BluetoothViewController: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {

        case .unknown:
            print("central.state is unknown")
        case .resetting:
            print("central.state is resetting")
        case .unsupported:
            print("central.state is unsupported")
        case .unauthorized:
            print("central.state is unauthorized")
        case .poweredOff:
            print("central.state is poweredOff")
        case .poweredOn:
            print("central.state is poweredOn")
            // 기기 스캔
//            centralManager.scanForPeripherals(withServices: [sendBleUuid], options: [CBCentralManagerScanOptionAllowDuplicatesKey:false])
            centralManager.scanForPeripherals(withServices: nil, options: [CBCentralManagerScanOptionAllowDuplicatesKey:false])
            
        @unknown default:
            print("default")
        }
    }

    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {

        print("=======================================")
        print("peripheral : \(peripheral)")
        print("advertisementData : \(advertisementData[CBAdvertisementDataServiceDataKey] as! String)")
        print("RSSI : \(RSSI)")
        print("=======================================")
    
        if let localName = advertisementData[CBAdvertisementDataLocalNameKey] as? String, localName == sendBleLocal {
            print("===========================")
            print("SAME NAME")
//            centralManager.stopScan()
            print("===========================")
        }
        
        
        if peripheral.identifier.uuidString == "B82601E0-54FC-894D-EEDD-6DDDCBCB0F21" {
            print("===========================")
            print("아갓츄")
        }
    }
}

extension BluetoothViewController: CBPeripheralManagerDelegate {
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        
        // 브로드캐스트
        if peripheral.state == .poweredOn {
            peripheralManager.startAdvertising([
                CBAdvertisementDataServiceUUIDsKey: [self.sendBleUuid],
                CBAdvertisementDataLocalNameKey: self.sendBleLocal,
                CBAdvertisementDataServiceDataKey: "leenitech"

            ])

            print("===============================")
            print("uuid :", self.sendBleUuid)
            print("local : ", self.sendBleLocal)
            print("===============================")
        }
    }
}
