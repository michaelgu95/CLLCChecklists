//
//  TutorialViewController.m
//  TEACCHMe
//
//  Created by Michael Gu on 12/25/14.
//  Copyright (c) 2014 Gutang. All rights reserved.
//

#import "TutorialViewController.h"
#import "EAIntroView.h"
#import "IntroControll.h"

@interface TutorialViewController () <EAIntroDelegate>

@end

@implementation TutorialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated{
    [self buildIntro];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)buildIntro {
    
    IntroModel *page1 = [[IntroModel alloc] initWithTitle:@"Welcome to TEACCH Me!" description:@"TEACCH Me is a scheduling application for residents of UNC TEACCH Autism Program." image:@"teacch.png"];
    
     IntroModel *page2 = [[IntroModel alloc] initWithTitle:@"" description:@"Start by creating a new checklist and adding as many items as desired." image:@"newchecklist.png"];
    
    IntroModel *page3 = [[IntroModel alloc] initWithTitle:@"" description:@"Then add names and choose images for each checklist item. Finish by giving the checklist a title and press 'Save'." image:@"newchecklist.png"];
    
    IntroModel *page4 = [[IntroModel alloc] initWithTitle:@"" description:@"Here's an example of a finished checklist in use:" image:@"newchecklist.png"];
    
    IntroModel *page5 = [[IntroModel alloc] initWithTitle:@"" description:@"When using the checklist, the back button is hidden to the upper left corner in order to minimize distractions." image:@"newchecklist.png"];
    
    IntroModel *page6 = [[IntroModel alloc] initWithTitle:@"" description:@"Similarly, the edit button is hidden while the checklist is in use. Clicking on the upper right corner will enable the editing mode." image:@"newchecklist.png"];
    
     self.view = [[IntroControll alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) pages:@[page1, page2, page3, page4, page5, page6]];
    
    
//
//    EAIntroPage *panel1 = [EAIntroPage page];
//    panel1.title = @"Welcome to TEACCH ME!";
//    panel1.desc =@"TEACCH Me is a scheduling application for residents of UNC TEACCH Autism Program.";
//    panel1.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"teacch.png"]];
//    panel1.bgImage = [UIImage imageNamed:@"bluebackground.jpg"];
//    
//   
//    
//    EAIntroPage *panel2 = [EAIntroPage pageWithCustomViewFromNibNamed:@"panel3"];
//    
//    EAIntroPage *panel3 = [EAIntroPage pageWithCustomViewFromNibNamed:@"panel4"];
//    
//    EAIntroPage *panel4 = [EAIntroPage pageWithCustomViewFromNibNamed:@"panel5"];
//    
//    EAIntroPage *panel5 = [EAIntroPage pageWithCustomViewFromNibNamed:@"panel6"];
//    
//    EAIntroPage *panel6 = [EAIntroPage pageWithCustomViewFromNibNamed:@"panel7"];
//    
//    NSArray *panels = @[panel1, panel2, panel3, panel4, panel5, panel6];
//    
//    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:self.view.bounds andPages:panels];
//    [intro setDelegate:self];
//    [intro showInView:self.view animateDuration:1.1];
}

-(void)back {
    [self performSegueWithIdentifier:@"start" sender:self];
}

- (void)introDidFinish:(EAIntroView *)introView {
    [self performSegueWithIdentifier:@"start" sender:self];
}


#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   
}


@end
