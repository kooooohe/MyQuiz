//
//  StartViewController.swift
//  MyQuiz
//
//  Created by 近藤 康平 on 2018/01/16.
//  Copyright © 2018年 kohe. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //次の画面に遷移する前に呼び出される[準備処理]
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //問題文の読み込み
        QuestionDataManager.sharedInstance.loadQuestion()
        
        //遷移先画面の呼び出し
        guard let nextViewController = segue.destination as? QuestionViewController else {
            return
        }
        
        //問題文の取り出し
        guard let questionData = QuestionDataManager.sharedInstance.nextQuestion() else {
            return
        }
        
        //次の画面に問題文を渡す
        nextViewController.questionData = questionData
    }
    
    
    //タイトルに戻ってくるときに呼び出される処理
    @IBAction func goToTitle(_ segue:UIStoryboardSegue) {
        
    }
}
