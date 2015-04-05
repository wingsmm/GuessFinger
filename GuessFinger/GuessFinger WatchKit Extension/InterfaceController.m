//
//  InterfaceController.m
//  GuessFinger WatchKit Extension
//
//  Created by ZhangBo on 15/4/5.
//  Copyright (c) 2015年 wingsmm. All rights reserved.
//

#import "InterfaceController.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


@interface InterfaceController()
@property (weak, nonatomic) IBOutlet WKInterfaceImage *image;
@property (weak, nonatomic) IBOutlet WKInterfaceButton *btn;

@end


@implementation InterfaceController
- (IBAction)btnClick {
    
    
    
    [self.image setImageNamed:@"image"];
    [self.image startAnimatingWithImagesInRange:NSMakeRange(0, 3) duration:0.2 repeatCount:5];
    [self.btn setEnabled:NO];
    
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC));
    dispatch_after(time, dispatch_get_main_queue(), ^{
        int index = arc4random_uniform(3);
        [self.image setImageNamed:[NSString stringWithFormat:@"image%d",index]];
        [self.btn setEnabled:YES];
    });
    
    

}

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



