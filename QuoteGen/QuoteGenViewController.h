//
//  QuoteGenViewController.h
//  QuoteGen
//
//  Created by Qwiki on 1/2/13.
//  Copyright (c) 2013 Qwiki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuoteGenViewController : UIViewController

//@property (nonatomic, strong) IBOutlet UILabel *movieLabel;
@property (nonatomic, strong) NSArray *myQuotes;
@property (nonatomic, strong) NSMutableArray *movieQuotes;
@property (nonatomic, strong) IBOutlet UITextView *quoteText;
@property (nonatomic, strong) IBOutlet UISegmentedControl *quoteOpt;

- (IBAction)quoteButtonTapped:(id)sender;

@end
