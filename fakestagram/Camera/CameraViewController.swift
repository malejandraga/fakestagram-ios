//
//  CameraViewController.swift
//  fakestagram
//
//  Created by LuisE on 4/27/19.
//  Copyright © 2019 3zcurdia. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {

    let client = CreatePostClient()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func createPost(img: UIImage) {
        guard let imgBase64 = img.encodedBase64() else { return }
        let timestamp = Date().currentTimestamp()
        client.create(title: String(timestamp), imageData: imgBase64) { post in
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
