//
//  ViewController.swift
//  SimpleCalciOS2
//
//  Created by Julia Bobrovskiy on 10/21/18.
//  Copyright © 2018 Julia Bobrovskiy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numTyped: [Int] = []
    var opTyped: [String] = []
    var doingMath = false
    var newOp = false
    var count = 0
    
    //@IBOutlet weak var label: UILabel!
    @IBOutlet weak var label: UILabel!
    
    // Function accepts a button action and clears
    // the calculator's memory
    @IBAction func clear(_ sender: UIButton) {
        numTyped = []
        opTyped = []
        label.text = ""
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        
        // If new operation is happening clear memory
        // of previous operation
        if(newOp) {
            count = 0
            numTyped = []
            opTyped = []
            label.text = ""
            newOp = false
        }
        
        // If math is happening show the operation, otherwise
        // show a longer string of numbers
        if (doingMath == true) {
            label.text = sender.titleLabel!.text!
            doingMath = false
        }else{
            label.text = label.text! + sender.titleLabel!.text!
        }
        
    }
    
    
    @IBAction func operations(_ sender: UIButton) {
        let operation = sender.titleLabel!.text
        count += 1
        if (Int(label.text!) != nil) {
            numTyped.append(Int(label.text!)!)
        }
        
        // if operation is happening, continue, otherwise
        // calculate the result
        if (label.text != "" && operation != "="){
            label.text = operation
            opTyped.append(operation!)
            doingMath = true
        } else if(operation == "=" ){
            label.text = String(result())
            newOp = true
        }
    }
    
    func result() -> Int {
        let opperand = opTyped[0]
        let x1 = numTyped[0]
        if(opperand == "fact"){
            numTyped = []
            opTyped = []
            return factorial(num: x1)
        }else if(opperand == "count"){
            numTyped = []
            opTyped = []
            return count
        } else if (opperand == "avg"){
            var total = 0
            for val in numTyped {
                total += val
            }
            numTyped = []
            opTyped = []
            return total / count
        }else{
            let x2 = numTyped[1]
            numTyped = []
            opTyped = []
            return doCalc(x1: x1, x2: x2, op: opperand)
        }
    }
    
    func doCalc(x1: Int, x2: Int, op: String) -> Int {
        if(op == "+"){
            return x1 + x2
        } else if(op == "-"){
            return x1 - x2
        }else if(op == "X"){
            return x1 * x2
        }else if(op == "/"){
            return x1 / x2
            
        }else if(op == "%"){
            return x1 % x2
        }
        return 0
    }
    
    func factorial(num: Int) -> Int {
        var answer = num
        var index = num
        while(index > 1) {
            answer *= index - 1
            index -= 1
        }
        return answer
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

