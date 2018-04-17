//
//  ViewController.swift
//  MAPD724-W2018-Lesson12-Part1
//
//  Created by Sergio de Almeida Brunacci on 2018-04-16.
//  Copyright © 2018 Centennial College. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var map: MKMapView!
    
    //To fix
    var lat = 43.6532
    var long = -79.3832
    var delta = 10.0
    let mapLocation = CLLocationCoordinate2DMake(43.6532, -79.3832)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loc = CLLocationCoordinate2DMake(lat, long)
        let span = MKCoordinateSpanMake(delta, delta)
        let reg = MKCoordinateRegionMake(loc, span)
        self.map.region = reg
        
        let ann = MKPointAnnotation()
        ann.coordinate = self.mapLocation
        ann.title = "Toronto"
        ann.subtitle = "A place that's really cool"
        self.map.addAnnotation(ann)
        
        
    }

    @IBAction func SeeInMapApp(_ sender: UIButton) {
        let placemark = MKPlacemark(coordinate: self.mapLocation, addressDictionary: nil)
        let mapitem = MKMapItem(placemark: placemark)
        mapitem.name = "A really icy place"
        mapitem.openInMaps(launchOptions: [
            MKLaunchOptionsMapCenterKey: MKMapType.standard.rawValue,
            MKLaunchOptionsMapCenterKey: self.map.region.center,
            MKLaunchOptionsMapSpanKey: self.map.region.span
        ])
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

