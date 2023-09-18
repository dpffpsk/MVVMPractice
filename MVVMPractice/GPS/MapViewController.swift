//
//  MapViewController.swift
//  MVVMPractice
//
//  Created by jiweon.lee on 2023/09/18.
//

import UIKit
import CoreLocation
import MapKit
import SnapKit

class MapViewController: UIViewController {

    // mapkit
    let mapKitView = MKMapView()
    
    var previousCoordinate: CLLocationCoordinate2D?
    
    lazy var locationManager: CLLocationManager = {
        let manager = CLLocationManager()
        
        /*
         - desiredAccuracy 정확도 설정
         kCLLocationAccuracyBestForNavigation : 가장 높은 수준의 정확도, 외부 전원이 연결되어 있을 경우에만 사용
         kCLLocationAccuracyBest : 배터리로 동작할 때 권장되는 가장 높은 수준의 정확도
         kCLLocationAccuracyNearestTenMeters : 10미터 이내의 정확도
         kCLLocationAccuracyHundredMeters : 100미터 이내의 정확도
         kCLLocationAccuracyKilometer : 1킬로미터 이내의 정확도
         kCLLocationAccuracyThreeKilometers : 3킬로미터 이내의 정확도
         */
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation() // startUpdate를 해야 didUpdateLocation 메서드가 호출 됨
        manager.delegate = self
        return manager
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getLocationUsagePermission()
        setupLayout()
        setupMapView()
    }
    
    func setupLayout() {
        view.addSubview(mapKitView)
        
        mapKitView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(100)
        }
    }
    
    func setupMapView() {
        // 지도에 내 위치 표시
        mapKitView.showsUserLocation = true
        
        // 현재 내 위치 기준으로 지도를 움직임
        mapKitView.setUserTrackingMode(.follow, animated: true)
        
        mapKitView.isZoomEnabled = true
        mapKitView.delegate = self
        
        
        // 위치 정해서 지도 그리기
        /*
         // 위도
         let latitude = location.coordinate.latitude
         // 경도
         let longitude = location.coordinate.longitude
         
         if let previousCoordinate = self.previousCoordinate {
             
             var points: [CLLocationCoordinate2D] = []
             
             let point1 = CLLocationCoordinate2DMake(previousCoordinate.latitude, previousCoordinate.longitude) // 이전 위치
             let point2: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude) // 현재 위치
             
             points.append(point1)
             points.append(point2)
             
             let lineDraw = MKPolyline(coordinates: points, count:points.count)
             mapKitView.addOverlay(lineDraw)
         }
         */
    
        var points: [CLLocationCoordinate2D] = []
        
        let point1: CLLocationCoordinate2D = CLLocationCoordinate2DMake(37.480722, 126.895288)
        let point2: CLLocationCoordinate2D = CLLocationCoordinate2DMake(37.480930, 126.893140)
        let point3: CLLocationCoordinate2D = CLLocationCoordinate2DMake(37.481884, 126.892979)
        let point4: CLLocationCoordinate2D = CLLocationCoordinate2DMake(37.482564, 126.893074)
        
        points.append(point1)
        points.append(point2)
        points.append(point3)
        points.append(point4)
        
        let lineDraw = MKPolyline(coordinates: points, count:points.count)
        mapKitView.addOverlay(lineDraw)
    }
    
    // 위치 권한
    func getLocationUsagePermission() {
        self.locationManager.requestWhenInUseAuthorization()
    }
}

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            print("GPS 권한 설정됨")
        case .restricted, .notDetermined:
            print("GPS 권한 설정되지 않음")
            DispatchQueue.main.async {
                self.getLocationUsagePermission()
            }
        case .denied:
            print("GPS 권한 요청 거부됨")
            DispatchQueue.main.async {
                self.getLocationUsagePermission()
            }
        default:
            print("GPS: Default")
        }
    }
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        
//        guard let location = locations.last else { return }
//        print("")
//        print("location : \(location)")
//        print("")
//        
//        // 위도
//        let latitude = location.coordinate.latitude
//        // 경도
//        let longitude = location.coordinate.longitude
//        
//        if let previousCoordinate = self.previousCoordinate {
//            
//            var points: [CLLocationCoordinate2D] = []
//            
//            let point1 = CLLocationCoordinate2DMake(previousCoordinate.latitude, previousCoordinate.longitude) // 이전 위치
//            let point2: CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude) // 현재 위치
//            
//            points.append(point1)
//            points.append(point2)
//            
//            let lineDraw = MKPolyline(coordinates: points, count:points.count)
//            mapKitView.addOverlay(lineDraw)
//        }
//        
//        self.previousCoordinate = location.coordinate
//    }
}

extension MapViewController: MKMapViewDelegate {
    
    // addOverlay 사용시 호출되는 함수
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        guard let polyLine = overlay as? MKPolyline
        else {
            print("can't draw polyline")
            return MKOverlayRenderer()
        }
        let renderer = MKPolylineRenderer(polyline: polyLine)
            renderer.strokeColor = .red
            renderer.lineWidth = 5.0
            renderer.alpha = 1.0

        return renderer
    }
}
