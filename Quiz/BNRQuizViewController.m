//
//  BNRQuizViewController.m
//  Quiz
//
//  Created by Izureru on 21/07/2014.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRQuizViewController.h"

@interface BNRQuizViewController ()

@property (nonatomic) int currentQuestionIndex;
@property (nonatomic) int currentChoiceAIndex;
@property (nonatomic) int currentChoiceBIndex;
@property (nonatomic) int currentChoiceCIndex;
@property (nonatomic) int currentChoiceDIndex;

@property (nonatomic, copy) NSArray *questions;

@property (nonatomic, copy) NSArray *choiceAs;

@property (nonatomic, copy) NSArray *choiceBs;

@property (nonatomic, copy) NSArray *choiceCs;

@property (nonatomic, copy) NSArray *choiceDs;

@property (nonatomic, copy) NSArray *answers;

@property (nonatomic, weak) IBOutlet UILabel
*questionLabel;

@property(nonatomic, weak) IBOutlet UILabel
*answerLabel;

@property(nonatomic, weak) IBOutlet UILabel
*choiceALabel;

@property(nonatomic, weak) IBOutlet UILabel
*choiceBLabel;

@property(nonatomic, weak) IBOutlet UILabel
*choiceCLabel;

@property(nonatomic, weak) IBOutlet UILabel
*choiceDLabel;

@end

@implementation BNRQuizViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
{
    //Call the init method implemented by the superclass
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        //Create two arrays filled with questions and answers and make the pointers point to them
        
        self.questions = @[@"Who is the current leader of the opposition?",
                           @"What is the name of the Governor General?",
                           @"How many seperate minitries are there in the cabinet?",
                           @"Who was Jamaica's first Prime MInister?",
                           @"Which two National Heroes were in direct conflict?",
                           @"People nuh stone mango tree wen it naa bear",
                           @"Betta belly bus dan good food waste",
                           @"Before monkey buy trousers, im affi know weh fi put im tail",
                           @"Chicken merry hawk deh near",
                           @"You shake man han but yu nuh shake im heart",
                           @"Spit inna di sky it fall back inna yu eye",
                           @"How many Counties are in Jamaica?",
                           @"What is the Capital of Westmoreland? ",
                           @"Is Jamaica a part of the Greater or lesser Antilles? ",
                           @"How tall is The Blue Mountain Peak?",
                           @"What is the longest River in Jamaica?"];
        
        self.choiceAs = @[@"Andrew Holness",
                          @"Patrick Allen",
                          @"19",
                          @"Alexander Bustamante",
                          @"Nanny and Paul Bogle",
                          @"people will attack you for your success",
                          @"it is better to overeat than to waste food",
                          @"Make sure the frashions of others suit you before you rush to adopt them ",
                          @"temper our light hearted moments with a little sobriety as danger can lurk in unexpec ted places ",
                          @"it is impossible to ascertain what is on a person heart from mere physical contact. Don’t take people’s feelings for granted",
                          @"what negative things you do or wish for others could be your own downfall",
                          @"3",
                          @"Savanna-la-mar",
                          @"Greater Antilles ",
                          @"2,256m",
                          @"Rio Minho"];
        
        self.choiceBs = @[@"Edward Seaga",
                           @"Patrick Allen",
                           @"19",
                           @"Alexander Bustamante",
                           @"Nanny and Paul Bogle",
                           @"people will attack you for your success",
                           @"it is better to overeat than to waste food",
                           @"Make sure the frashions of others suit you before you rush to adopt them ",
                           @"temper our light hearted moments with a little sobriety as danger can lurk in unexpec ted places ",
                           @"it is impossible to ascertain what is on a person heart from mere physical contact. Don’t take people’s feelings for granted",
                           @"what negative things you do or wish for others could be your own downfall",
                           @"3",
                           @"Savanna-la-mar",
                           @"greater Antilles ",
                           @"2,256m",
                           @"Rio Minho"];

        self.choiceCs = @[@"Barak Obama",
                          @"Patrick Allen",
                          @"19",
                          @"Alexander Bustamante",
                          @"Nanny and Paul Bogle",
                          @"people will attack you for your success",
                          @"it is better to overeat than to waste food",
                          @"Make sure the frashions of others suit you before you rush to adopt them ",
                          @"temper our light hearted moments with a little sobriety as danger can lurk in unexpec ted places ",
                          @"it is impossible to ascertain what is on a person heart from mere physical contact. Don’t take people’s feelings for granted",
                          @"what negative things you do or wish for others could be your own downfall",
                          @"3",
                          @"Savanna-la-mar",
                          @"greater Antilles ",
                          @"2,256m",
                          @"Rio Minho"];
        
        self.choiceDs = @[@"Barak Obama",
                           @"Patrick Allen",
                           @"19",
                           @"Alexander Bustamante",
                           @"Nanny and Paul Bogle",
                           @"people will attack you for your success",
                           @"it is better to overeat than to waste food",
                           @"Make sure the frashions of others suit you before you rush to adopt them ",
                           @"temper our light hearted moments with a little sobriety as danger can lurk in unexpec ted places ",
                           @"it is impossible to ascertain what is on a person heart from mere physical contact. Don’t take people’s feelings for granted",
                           @"what negative things you do or wish for others could be your own downfall",
                           @"3",
                           @"Savanna-la-mar",
                           @"greater Antilles ",
                           @"2,256m",
                           @"Rio Minho"];
        
        self.answers = @[@"Andrew Holness",
                         @"Patrick Allen",
                         @"19",
                         @"Alexander Bustamante",
                         @"Nanny and Paul Bogle",
                         @"people will attack you for your success",
                         @"it is better to overeat than to waste food",
                         @"Make sure the frashions of others suit you before you rush to adopt them ",
                         @"temper our light hearted moments with a little sobriety as danger can lurk in unexpec ted places ",
                         @"it is impossible to ascertain what is on a person heart from mere physical contact. Don’t take people’s feelings for granted",
                         @"what negative things you do or wish for others could be your own downfall",
                         @"3",
                         @"Savanna-la-mar",
                         @"Greater Antilles ",
                         @"2,256m",
                         @"Rio Minho"];
    }
    //Return the address of the new object
    return self;
}

// page 45 doesn't give a good description of where the following code goes but page 51 confirms correct
- (IBAction)showQuestion:(id)sender
{
    //Step to the next question
    self.currentQuestionIndex++;
    self.currentChoiceAIndex++;
    self.currentChoiceBIndex++;
    self.currentChoiceCIndex++;
    self.currentChoiceDIndex++;
    
    //Am I past the last question?
    if (self.currentQuestionIndex == [self.questions count]){
    
        //Go back to the first question
        self.currentQuestionIndex = 0;
        self.currentChoiceAIndex = 0;
        self.currentChoiceBIndex = 0;
        self.currentChoiceCIndex = 0;
        self.currentChoiceDIndex = 0;

        
    }
        //Get the string at that index in the questions array
        NSString *question = self.questions[self.currentQuestionIndex];
        
        NSString *choiceA = self.choiceAs[self.currentChoiceAIndex];
        
        NSString *choiceB = self.choiceBs[self.currentChoiceBIndex];
        
        NSString *choiceC = self.choiceCs[self.currentChoiceCIndex];
        
        NSString *choiceD = self.choiceDs[self.currentChoiceDIndex];
    
    //Display the string in the question label
    self.questionLabel.text = question;
    self.choiceALabel.text = choiceA;
    self.choiceBLabel.text = choiceB;
    self.choiceCLabel.text = choiceC;
    self.choiceDLabel.text = choiceD;
  
    //Reset the answer label
    self.answerLabel.text = @"???";

}

- (IBAction)showAnswer:(id)sender
{
    //What is the answer to the current question?
    NSString *answer = self.answers[self.currentQuestionIndex];
    
    //Display it in the answer label
    self.answerLabel.text = answer;
}

@end
