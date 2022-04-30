//
//  ViewController.swift
//  Nabeatsu
//
//  Created by nagata on 2017/06/19.
//  Copyright © 2017年 Life is Tech!. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var countLabel: UILabel!
    @IBOutlet var faceLabel: UILabel!
    
    var number: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func plusButton() {
        number = number + 1
        countLabel.text = String(number)
        
        if isAho(num: number) && isPrime(num: number) {
            faceLabel.text = "ｱﾋｬ ﾍ(ﾟ∀ﾟﾍ)ｿｽｳﾀﾞﾖ"
            return
        }
        if isAho(num: number) {
            faceLabel.text = "ﾍ(ﾟ∀ﾟﾍ)ｱﾋｬ"
            return
        }
        if isPrime(num: number) {
            faceLabel.text = "(★‿★)ｿｽｳﾃﾞｽ"
            return
        }
        faceLabel.text = "(゜o゜)"
    }
    
    @IBAction func onClear() {
        number = 0
        countLabel.text = String(0)
        faceLabel.text = "(゜o゜)"
    }
    
    //3の倍数or3がつくかどうか
    func isAho(num: Int) -> Bool {
        // 問題1: 3の倍数かどうか調べる
        if num % 3 == 0 {
            return true
        }
        // 問題4: 3がつくかどうか調べる
        var numberCopy: Int = num
        while numberCopy != 0 {
            if numberCopy % 10 == 3 {
                return true
            } else {
                numberCopy /= 10
            }
        }
        
        return false
    }
    
    //素数かどうか
    func isPrime(num: Int) -> Bool {
        if num == 1 { return false}
        //√n以下の素数で割り切れるかどうか
        let maxDivisor = Int(sqrt(Double(num)))
        for prime in primes(num: maxDivisor) {
            if num % prime == 0 {
                return false
            }
        }
        return true
    }
    
    //num以下の素数一覧
    func primes(num: Int) -> [Int] {
        var numbers: [(number: Int, isPrime: Bool)] = (0...num).map {
            if $0 == 0 || $0 == 1 {
                return (number: $0, isPrime: false)
            } else {
                return (number: $0, isPrime: true)
            }
        }
        let endNum = Int(sqrt(Double(num)))
        if endNum == 0 { return []}
        for i in 1...endNum {
            if numbers[i].isPrime == false { continue }
            for j in i * 2...num + 1 {
                if j % i == 1 {
                    numbers[j - 1].isPrime = false
                }
            }
        }
        
        let primes: [Int] = numbers.filter { $0.isPrime == true }
            .map { $0.number }
        
        return primes
    }
    
}

