//
//  GPSManager.swift
//  GumamdongAR
//
//  Created by YEHROEI HO on 11/5/24.
//

import Foundation
import CoreLocation

class GPSManager: NSObject, ObservableObject, CLLocationManagerDelegate {
  
    @Published var coordinate: CLLocationCoordinate2D? = nil
    private var locationManager: CLLocationManager?
    
    override init() {
        super.init()
        setupLocationManagerDelegate()
    }
    
    private func setupLocationManagerDelegate() {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
    }
    
    // GPS 권한 팝업 설정
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization() // 위치 정보를 받기 전에 권한을 묻는다.
        case .authorizedWhenInUse, .authorizedAlways:
            manager.startUpdatingLocation() // 실시간으로 기기의 위치를 받아온다.
        default:
            print("위치 정보 획득에 실패했습니다.")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            print("기기의 좌표를 받아왔습니다. \(location.coordinate)")
            coordinate = location.coordinate
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("위치 정보 획득에 실패했습니다.")
    }
}
