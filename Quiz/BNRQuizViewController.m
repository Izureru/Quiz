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
                           @"To which 'Antilles' does Jamaica belong? ",
                           @"How tall is The Blue Mountain Peak?",
                           @"What is the longest River in Jamaica?"];
        
        self.choiceAs = @[@"Andrew Holness",
                          @"Sir Florizel Glasspole",
                          @"19",
                          @"Alexander Bustamante",
                          @"Norman Manley, Michael Manley",
                          @"A fruitless mango tree is poisonous",
                          @"only eat when neccessary",
                          @"Make sure the fashions of others suit you before you rush to adopt them ",
                          @"instead of eating chicken, try eating hawk",
                          @"it is impossible to ascertain what is on a person heart from mere physical contact. Don’t take people’s feelings for granted",
                          @"Always aim high",
                          @"7",
                          @"North-west Town",
                          @"Greater Antilles ",
                          @"2,000m",
                          @"Rio Minho"];
        
        self.choiceBs = @[@"Edward Seaga",
                           @"Howard Cooke",
                           @"33",
                           @"Norman Manley",
                           @"Nanny, Paul Bogle",
                           @"Its better to climb a mango tree when there are no mangoes",
                           @"it is better to overeat than to waste food",
                           @"if a monkey can find a good sale, so can you",
                           @"always cook chicken with wine or beer",
                           @"Always wear you heart on your sleeve",
                           @"Spitting is a health risk",
                           @"3",
                           @"Lucea",
                           @"Lesser Antilles ",
                           @"1,250m",
                           @"Ocho Rios"];

        self.choiceCs = @[@"Barak Obama",
                          @"Clifford Campbell",
                          @"17",
                          @"George Washington",
                          @"Marcus Garvey, Bob Marley",
                          @"people will attack you for your success",
                          @"overeating can cure illness",
                          @"Be sure to leave room to grow when you buy clothes",
                          @"temper our light hearted moments with a little sobriety as danger can lurk in unexpec ted places ",
                          @"People can die from handshakes",
                          @"what negative things you do or wish for others could be your own downfall",
                          @"14",
                          @"Hannover",
                          @"Leeward Antilles ",
                          @"2,256m",
                          @"Yallahs River"];
        
        self.choiceDs = @[@"Portia Simpson-Miller",
                           @"Patrick Allen",
                           @"21",
                           @"P J Patterson",
                           @"Sam Sharpe, Nanny",
                           @"Look befor you throw",
                           @"better to eat to live than live to eat",
                           @"When a male is buying trousers, make sure he is in the right section.",
                           @"Free range chicken tastes better than a wild hawk",
                           @"People shake hands because they would die if they removed their heart",
                           @"If you spit, walk faster",
                           @"1",
                           @"Savanna-la-mar",
                           @"Hispaniola Antilles ",
                           @"2,200m",
                           @"Rio Cobre"];
        
        self.answers = @[@"Andrew Holness",
                         @"Patrick Allen",
                         @"19",
                         @"Alexander Bustamante",
                         @"Nanny and Paul Bogle",
                         @"people will attack you for your success",
                         @"it is better to overeat than to waste food",
                         @"Make sure the fashions of others suit you before you rush to adopt them ",
                         @"temper our light hearted moments with a little sobriety as danger can lurk in unexpec ted places ",
                         @"it is impossible to ascertain what is on a person heart from mere physical contact. Don’t take people’s feelings for granted",
                         @"what negative things you do or wish for others could be your own downfall",
                         @"3",
                         @"Savanna-la-mar",
                         @"Netherlands Antilles",
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
