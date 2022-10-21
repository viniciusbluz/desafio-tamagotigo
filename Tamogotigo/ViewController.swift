//
//  ViewController.swift
//  Tamogotigo
//
//  Created by Julia Eileen Schäfer on 20/10/22.
//

import UIKit
import SpriteKit


class ViewController: UIViewController {
    var snowScene: SnowScene?
    var snowEnergy = 1.0
    var snowIsAlive: Bool = true
    
    @IBOutlet weak var gameOverStatus: UILabel!
    @IBOutlet weak var snowView: SKView!
    @IBOutlet weak var snowEnergyBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        snowEnergyBar.progress = Float(snowEnergy)
        snowScene = SnowScene(size: CGSize(width: snowView.frame.size.width, height: snowView.frame.size.height))
        snowView.presentScene(snowScene)
    }
    
    @IBAction func buttonSnowRun(_ sender: Any) {
        snowRun()
    }
    func snowRun() {
        // coloque aqui o código do que precisa ser feito quando ele correr
        if(snowIsAlive){
            snowEnergy -= 0.25
            if(snowEnergy <= 0.0){
                snowIsAlive = false
            }
            snowScene?.startRunningAnimation()
            self.snowEnergyBar.progress = Float(snowEnergy)
        }else{
            snowDefeated()
        }
        
        //ignore o código abaixo
        //snowScene?.startRunningAnimation()
        
        // resetando a animação do snow para idle após 3 segundos
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { timer in
            self.snowScene?.startIdleAnimation()
        }
    }
    
    @IBAction func buttonSnowBark(_ sender: Any) {
        snowBark()
    }
    
    func snowBark() {
        // coloque aqui o código do que precisa ser feito quando ele latir
        if(snowIsAlive){
            snowEnergy -= 0.10
            if(snowEnergy <= 0.0){
                snowIsAlive = false
            }
            snowScene?.startBarkAnimation()
            self.snowEnergyBar.progress = Float(snowEnergy)
        }else{
            snowDefeated()
        }
        
        // ignore o código abaixo
        //snowScene?.startBarkAnimation()
        
        // resetando a animação do snow para idle após 3 segundos
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { timer in
            self.snowScene?.startIdleAnimation()
        }
    }
    
    func snowDefeated() {
        // coloque aqui o código do que precisa ser feito quando o snow for derrotado
        self.snowEnergyBar.progress = Float(0)
        
        gameOverStatus.text = "GAME OVER"
        
        // ignore o código abaixo
        snowScene?.startDefeatedAnimation()
    }
    @IBAction func buttonSnowSit(_ sender: Any) {
        snowSit()
    }
    func snowSit() {
        // coloque aqui o código do que precisa ser feito quando o snow descansar
        if(snowIsAlive){
            snowEnergy += 0.15
            self.snowEnergyBar.progress = Float(snowEnergy)
        }else{
            snowDefeated()
        }
        
        // ignore o código abaixo
        snowScene?.startSitAnimation()
        
        // resetando a animação do snow para idle após 3 segundos
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false) { timer in
            self.snowScene?.startIdleAnimation()
        }
    }
    
    // só escondendo a status bar
    // testa remover abaixo pra ver como fica sem
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

