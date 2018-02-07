//
//  QuestionViewController.swift
//  MyQuiz
//
//  Created by 近藤 康平 on 2018/01/17.
//  Copyright © 2018年 kohe. All rights reserved.
//

import UIKit
import AudioToolbox

class QuestionViewController: UIViewController {
    var questionData: QuestionData!
    @IBOutlet weak var questionNoLabel: UILabel! //問題番号ラベル
    
    @IBOutlet weak var questionTextView: UITextView! //問題文テキストビュー
    @IBOutlet weak var answer1Button: UIButton!
    @IBOutlet weak var answer2Button: UIButton!
    @IBOutlet weak var answer3Button: UIButton!
    @IBOutlet weak var answer4Button: UIButton!
    
    @IBOutlet weak var correctImageView: UIImageView! //正解時のイメージビュー
    @IBOutlet weak var incorrectImageView: UIImageView! //不正解時のイメージビュー

    //初期データ設定処理. 前画面で設定済みのquestionDataから値を取り出す
    override func viewDidLoad() {
        super.viewDidLoad()
        questionNoLabel.text = "Q.\(questionData.questionNo)"
        questionTextView.text = questionData.question
        answer1Button.setTitle(questionData.answer1, for: UIControlState.normal)
        answer2Button.setTitle(questionData.answer2, for: UIControlState.normal)
        answer3Button.setTitle(questionData.answer3, for: UIControlState.normal)
        answer4Button.setTitle(questionData.answer4, for: UIControlState.normal)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
     
    }
    
    @IBAction func tapAnswer1Button(_ sender: Any) {
        questionData.userChoiceAnswerNumber = 1 //選択した答えの番号を保存する
        goNextQuestionWithAnimation()           //次の問題に進む
    }
    @IBAction func tapAnswer2Button(_ sender: Any) {
        questionData.userChoiceAnswerNumber = 2
        goNextQuestionWithAnimation()
    }
    
    @IBAction func tapAnswer3Button(_ sender: Any) {
        questionData.userChoiceAnswerNumber = 3
        goNextQuestionWithAnimation()
    }
    @IBAction func tapAnswer4Button(_ sender: Any) {
        questionData.userChoiceAnswerNumber = 4
        goNextQuestionWithAnimation()
    }
    
    //次の問題にアニメーション付きで進む
    func goNextQuestionWithAnimation() {
        //正解しているか判定
        if questionData.isCorrect() {
            //正解のアニメーションを再生しながら次の問題へ遷移する
            goNextQuestionWithCorrectAnimation()
        } else {
            //不正解のアニメーションを再生しながら次の問題へ遷移する
            goNextQuestionWithIncorrectAnimation()
        }
    }
    
    //次の問題に正解のアニメーション付きで遷移する
    func goNextQuestionWithCorrectAnimation() {
        //正解を伝える音を鳴らす
        AudioServicesPlayAlertSound(1025)
        
        //アニメーション
        UIView.animate(withDuration: 2.0, animations: {
            //アルファ値を1.0に変化させる（初期値はStoryboardで0.0に設定済み)
            self.correctImageView.alpha = 1.0
        }) { (Bool) in
            //アニメーション完了後に次の問題へ進む
            self.goNextQuestion()
        }
        
    }
    
    //次の問題に不正解のアニメーション付きで遷移する
    func goNextQuestionWithIncorrectAnimation() {
        AudioServicesPlayAlertSound(1006)
        
        UIView.animate(withDuration: 2.0, animations: {
            self.incorrectImageView.alpha = 1.0
        }) { (Bool) in
            self.goNextQuestion()
        }
    }
    
    //次の問題へ遷移する
    func goNextQuestion() {
        //問題文の取り出し
        guard let nextQuestion = QuestionDataManager.sharedInstance.nextQuestion() else {
            //問題がなれければ結果画面へ遷移する
            //StorybodrdのIdentifierに設定した値(result)を指定して
            //ViewControllerを生成する
            if let resultViewController = storyboard?.instantiateViewController(withIdentifier: "result") as? ResultViewController {
                //StoryboardのSegueを利用しない明示的なが面遷移処理
                present(resultViewController, animated: true, completion: nil)
            }
            return
        }
     
        //問題文がある場合は次の問題へ遷移する
        //StorybodrdのIdentifierに設定した値(question)を指定して
        //ViewContollerを生成する
        if let nextQuestionViewController = storyboard?.instantiateViewController(withIdentifier: "question") as? QuestionViewController {
            nextQuestionViewController.questionData = nextQuestion
            present(nextQuestionViewController, animated: true, completion: nil)
        }

    }
}













