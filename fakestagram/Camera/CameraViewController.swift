//
//  CameraViewController.swift
//  fakestagram
//
//  Created by LuisE on 4/27/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit
import AVFoundation
import CoreLocation

class CameraViewController: UIViewController {
    let locationManager = CLLocationManager()
    let client = CreatePostClient()
    var currentLocation: CLLocation?

    override func viewDidLoad() {
        super.viewDidLoad()
        enableBasicLocationServices()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        locationManager.startUpdatingLocation()
    }

    override func viewWillDisappear(_ animated: Bool) {
        locationManager.startUpdatingLocation()
        super.viewWillDisappear(animated)
    }

    @IBAction func onTapCapture(_ sender: Any) {
//        print("posting....")
//        let img = UIImage(named: "horse")!
//        createPost(img: img)
        choosePicture()
    }
    
    func choosePicture() {
        let pickerController = UIImagePickerController()
        pickerController.allowsEditing = true
        pickerController.delegate = self
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) in
            pickerController.sourceType = .camera
            self.present(pickerController,animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Library", style: .default, handler: { (action) in
            pickerController.sourceType = .photoLibrary
            //present(pickerController,animated: true, completion: nil)
            self.present(pickerController,animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        present(actionSheet,animated: true, completion: nil)
    }

    func enableBasicLocationServices() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            print("Disable location features")
        case .authorizedWhenInUse, .authorizedAlways:
            print("Enable location features")
        }
    }

    func createPost(img: UIImage) {
        guard let imgBase64 = img.encodedBase64() else { return }
        let timestamp = Date().currentTimestamp()
        client.create(title: String(timestamp), imageData: imgBase64, location: currentLocation) { post in
            print(post)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension CameraViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.currentLocation = locations.last
    }
}


extension CameraViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        //imageView.image = image
        createPost(img: image)
        picker.dismiss(animated: true, completion: nil)
    }
}
