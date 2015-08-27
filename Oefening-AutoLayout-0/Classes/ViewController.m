//
//  ViewController.m
//  Oefening-AutoLayout-0
//
//  Created by Jonathan Provo on 27/08/15.
//  Copyright (c) 2015. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *horizontalContraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *verticalContraint;

@property (assign, nonatomic) BOOL hasPressedButton;

- (void)animateConstraintsAnimated:(BOOL)animated;

@end

@implementation ViewController

#pragma mark - IBAction

- (IBAction)didClickAnimateButton:(UIBarButtonItem *)button
{
    self.hasPressedButton = !self.hasPressedButton;
    [self animateConstraintsAnimated:self.hasPressedButton]; // you can try `NO` as well to see the change without animation
}


#pragma mark - Private methods

- (void)animateConstraintsAnimated:(BOOL)animated
{
    CGFloat targetValue = (self.hasPressedButton == YES ? 50.0f : 0.0f);
    
    if (animated) {
        [UIView animateWithDuration:1.0f animations:^{
            self.horizontalContraint.constant = targetValue;
            self.verticalContraint.constant = targetValue;
            [self.view layoutIfNeeded]; // this is a special case, the view needs to be updated in each frame of the animation
        }];
        
    } else {
        self.horizontalContraint.constant = targetValue;
        self.verticalContraint.constant = targetValue;
    }
}

@end
