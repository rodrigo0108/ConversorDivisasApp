//
//  ViewController.swift
//  ConversorDivisasApp
//
//  Created by Rodrigo Ramos on 22/05/18.
//  Copyright © 2018 Ramos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var initialValue: UITextField!
    @IBOutlet weak var fromSegment: UISegmentedControl!
    @IBOutlet weak var toSegment: UISegmentedControl!
    @IBOutlet weak var finalValue: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func convertir(_ sender: UIButton) {
        
        if(Double(initialValue.text!) != nil){
          
            let numero:Double = Double(initialValue.text!)!
            var resultado:Double = 0.0
            
            switch (fromSegment.selectedSegmentIndex) {
            case 0:
                resultado = millasConverter(inicial: numero, toSegment: toSegment.selectedSegmentIndex)
                finalValue.text = " \(fixData(valor: numero)) \(getType(index: fromSegment.selectedSegmentIndex)) = \(fixData(valor: resultado)) \(getType(index: toSegment.selectedSegmentIndex))"
                break
            case 1:
                resultado = kmConventer(inicial: numero, toSegment: toSegment.selectedSegmentIndex)
                finalValue.text = " \(fixData(valor: numero)) \(getType(index: fromSegment.selectedSegmentIndex)) = \(fixData(valor: resultado)) \(getType(index: toSegment.selectedSegmentIndex))"
                break
            case 2:
                resultado = yardConverter(inicial: numero, toSegment: toSegment.selectedSegmentIndex)
                finalValue.text = " \(fixData(valor: numero)) \(getType(index: fromSegment.selectedSegmentIndex)) = \(fixData(valor: resultado)) \(getType(index: toSegment.selectedSegmentIndex))"
                break
            case 3:
                resultado = piesConverter(inicial: numero, toSegment: toSegment.selectedSegmentIndex)
                finalValue.text = " \(fixData(valor: numero)) \(getType(index: fromSegment.selectedSegmentIndex)) = \(fixData(valor: resultado)) \(getType(index: toSegment.selectedSegmentIndex))"
                break
            default:
                break
            }
        }else{
            finalValue.text = "Verifica tu valor"
        }
    }
    
    func getType(index:Int) -> String{
        var res:String = ""
        switch index {
        case 0:
            res = "Millas"
            break
        case 1:
            res = "Kms"
            break
        case 2:
            res = "Yardas"
            break
        case 3:
            res = "Pies"
            break
        default:
            break
        }
        return res
    }
    
    func yardConverter(inicial:Double, toSegment:Int) -> Double{
        var resultado:Double = 0.0
        switch toSegment {
        case 0:
            resultado=yardtomill(valor: inicial)
            break
        case 1:
            resultado=yardtokm(valor: inicial)
            break
        case 2:
            resultado=inicial
            break
        case 3:
            resultado=yardtopies(valor: inicial)
            break
        default:
            break
        }
        return resultado
    }
    
    func kmConventer(inicial:Double, toSegment:Int) -> Double{
        var resultado:Double = 0.0
        switch toSegment {
        case 0:
            resultado=kmtomill(valor: inicial)
            break
        case 1:
            resultado=inicial
            break
        case 2:
            resultado=kmtoyard(valor: inicial)
            break
        case 3:
            resultado=kmtopies(valor: inicial)
            break
        default:
            break
        }
        return resultado
    }
    
    func millasConverter(inicial:Double, toSegment:Int) -> Double{
        var resultado:Double = 0.0
        switch toSegment {
        case 0:
            resultado = inicial
            break
        case 1:
            resultado = milltokm(valor: inicial)
            break
        case 2:
            resultado = milltoyard(valor: inicial)
            break
        case 3:
            resultado = milltopies(valor: inicial)
        default:
            break
        }
        return resultado
    }
    
    func piesConverter(inicial:Double, toSegment:Int) -> Double{
        var resultado:Double = 0.0
        switch toSegment {
        case 0:
            resultado = piestomill(valor: inicial)
            break
        case 1:
            resultado = piestokm(valor: inicial)
            break
        case 2:
            resultado = piestoyard(valor: inicial)
            break
        case 3:
            resultado = inicial
            break
        default:
            break
        }
        return resultado
    }
    
    func fixData(valor:Double) ->String{
        return String(format: "%.2f", valor)
    }
    
    func kmtomill(valor: Double) -> Double{
        return valor*0.621371
    }
    
    func kmtoyard(valor:Double) -> Double{
        return valor*1093.61
    }
    
    func kmtopies(valor: Double) -> Double{
        return valor*3280.84
    }
    
    func milltokm(valor:Double) -> Double{
        return valor*1.60934
    }
    
    func milltoyard(valor:Double) -> Double{
        return valor*1760
    }
    
    func milltopies(valor:Double) -> Double{
        return valor*5280
    }
    
    func yardtokm(valor:Double) -> Double{
        return valor*0.0009144
    }
    
    func yardtomill(valor:Double) -> Double{
        return valor*0.000568182
    }
    
    func yardtopies(valor:Double) -> Double{
        return valor*3
    }
    
    func piestomill(valor:Double) -> Double{
        return valor*0.000189394
    }
    
    func piestokm(valor:Double) -> Double{
        return valor*0.0003048
    }
    
    func piestoyard(valor:Double) -> Double{
        return valor*0.333333
    }
    
    
    
    
    func setResult( label: UILabel, initialValue:Double, fromValue:Int,toValue:Int,finalValue:Double){
        label.text = "\(fixData(valor: initialValue)) \(getType(index: fromValue)) = \(fixData(valor: finalValue)) \(getType(index: toValue))"
    }
}

