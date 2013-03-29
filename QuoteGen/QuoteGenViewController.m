//
//  QuoteGenViewController.m
//  QuoteGen
//
//  Created by Constantine Antonakos on 1/2/13.
//  Copyright (c) 2013 Qwiki. All rights reserved.
//

#import "QuoteGenViewController.h"

@interface QuoteGenViewController ()

@end

@implementation QuoteGenViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //self.navigationItem.leftBarButtonItem = self.editButtonItem;

    
    //Add array of idioms
    self.myQuotes = @[
        @"Live and let live.",
        @"Don't cry over spilt milk.",
        @"Always look on the bright side of life.",
        @"Nobody's perfect.",
        @"Can't see the woods for the trees.",
        @"Better to have loved and lost then not loved at all.",
        @"The early bird catches the worm.",
        @"As slow as a wet week."
    ];
    
    NSString *plistCatPath = [[NSBundle mainBundle] pathForResource:@"quotes" ofType:@"plist"];
    self.movieQuotes = [NSMutableArray arrayWithContentsOfFile:plistCatPath];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 -(IBAction)quoteButtonTapped:(id)sender {
 // 1 - Get number of rows in array
 int array_tot = [self.myQuotes count];
 // 2 - Get random index
 int index = (arc4random() % array_tot);
 // 3 - Get the quote string for the index
 NSString *my_quote = self.myQuotes[index];
 // 4 - Display the quote in the text view
 self.quoteText.text = [NSString stringWithFormat:@"Quote:\n\n%@",  my_quote];
 }*/

/*-(IBAction)quoteButtonTapped:(id)sender {
 // 1 - Get number of rows in array
 int array_tot = [self.movieQuotes count];
 // 2 - Get random index
 int index = (arc4random() % array_tot);
 // 3 - Get the quote string for the index
 //NSString *my_quote = [self.myQuotes objectAtIndex:index];
 NSString *my_quote = self.movieQuotes[index][@"quote"];
 // 4 - Display the quote in the text view
 self.quoteText.text = [NSString stringWithFormat:@"Quote:\n\n%@",  my_quote];
 }*/

-(IBAction)quoteButtonTapped:(id)sender
{
    // Get personal quotes when the final segment is selected
    if (self.quoteOpt.selectedSegmentIndex == 2) {
        // 1 - Get number of rows in array
        int arrayTotal = [self.myQuotes count];
        // 2 - Get random index
        int index = (arc4random() % arrayTotal);
        // 3 - Get the quote string for the index
        //NSString *my_quote = [self.myQuotes objectAtIndex:index];
        NSString *myQuote = self.myQuotes[index];
        // 4 - Display the quote in the text view
        self.quoteText.text = [NSString stringWithFormat:@"\n\n%@",  myQuote];
    }

    // Get movie quotes
    else {
        // Determine category and label
        NSString *selectedCategory = nil;
        NSString *categoryLabel = nil;
        if (self.quoteOpt.selectedSegmentIndex == 0){
            selectedCategory = @"classic";
            categoryLabel = @"Classic movie quote";
            
        }
        else {
            selectedCategory = @"modern";
            categoryLabel = @"Modern movie quote";
        }
        // Filter array by category using predicate
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"category == %@", selectedCategory];
        NSArray *filteredArray = [self.movieQuotes filteredArrayUsingPredicate:predicate];
        // Get total number in filtered array
        int arrayTotal = [filteredArray count];
    
        // Get random index
        int index = (arc4random() % arrayTotal);
        // Get the quote string for the index
        NSString *quote = filteredArray[index][@"quote"];
        // Check if there is a source
        NSString *source = [[filteredArray objectAtIndex:index] valueForKey:@"source"];
        if (![source length] == 0) {
            source = [[filteredArray objectAtIndex: index] valueForKey:@"source"];
        }
        else {
            source = @"Source not found";
        }
        
        // Display quote
        self.quoteText.text = [NSString stringWithFormat:@"%@:\n\n%@\n\n(%@)", categoryLabel, quote, source];

//        } else {
//            self.quoteText.text = [NSString stringWithFormat:@"No quotes to display."];
    }
}

@end
