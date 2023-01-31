//
//  MapViewController.swift
//  Eateries
//
//  Created by Karen Vardanian on 30.01.2023.
//
import MapKit
import UIKit

class MapViewController: UIViewController, MKMapViewDelegate {
    
    var restaurant: Restaurant!
    
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        let goecoder = CLGeocoder()
        goecoder.geocodeAddressString(restaurant.location) { placemarks, error in
            guard error == nil else {return}
            guard let placemarks = placemarks else { return }
            
            let placemark = placemarks.first!
            let annotation = MKPointAnnotation()
            annotation.title = self.restaurant.name
            annotation.subtitle = self.restaurant.type
            
            guard let location = placemark.location else { return }
            annotation.coordinate = location.coordinate
            
            self.mapView.showAnnotations([annotation], animated: true)
            self.mapView.selectAnnotation(annotation, animated: true)
        }
    }
    
    func mapView( _ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {return nil}
        
        let annotationIdentifier = "restAnnotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) as? MKMarkerAnnotationView
        
        if annotationView == nil {
            annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView?.canShowCallout = true
        }
        let rightImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        rightImage.image = UIImage(named: restaurant.image)
        annotationView?.rightCalloutAccessoryView = rightImage
        
        annotationView?.markerTintColor = .magenta
        
        return annotationView
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
