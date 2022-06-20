//
//  ViewController.swift
//  saveimagewithCoreData
//
//  Created by Meghna on 20/06/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btnGetImag: UIButton!
    @IBOutlet weak var imgFirst: UIImageView!
    @IBOutlet weak var imgSecond: UIImageView!
    
    @IBOutlet weak var btnSaveImg: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func btnGetImgClick(_ sender: UIButton) {
        
        ImagePickerManager().pickImage(self){ image in
               print("image.....\(image)")
            self.imgFirst.image = image
           }
    }
    @IBAction func btnSaveImgClick(_ sender: UIButton) {
//        let jpg = self.imgFirst.image?.jpegData(compressionQuality: 0.75)
        if let png = self.imgFirst.image?.pngData(){
            DatabaseHelper.instance.saveImageinCoreData(at: png)
        }
        
        var arr = DatabaseHelper.instance.getAllImages()
        self.imgSecond.image = UIImage(data: arr[0].img!)
    }
}

