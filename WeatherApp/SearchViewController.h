//
//  SearchViewController.h
//  WeatherApp
//
//  Created by Vijay on 30/05/17.
//  Copyright © 2017 Neorays. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"


@protocol ViewBProtocol;
@interface SearchViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>{
    
//    NSMutableArray *contentList;
//    BOOL isSearching;
//     NSMutableArray *filteredContentList;
    BOOL isempty;
   // NSString *tabText;
}


//@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@property (weak, nonatomic) IBOutlet UITextField *searchLocation;

@property (weak, nonatomic) IBOutlet UITableView *tableViewOutlet;

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;



-(void)setData:(NSString *)data;
//-(void)getcity:(NSMutableArray*)getcity;
@property(strong, nonatomic)NSMutableArray *cityNames;
@property (strong,nonatomic)NSArray *cityArray;
@property (nonatomic,weak)id<ViewBProtocol> delegate;
@property (strong,nonatomic)NSDictionary *obj;
@property(strong, nonatomic)NSString *url;
//@property (strong,nonatomic)NSString *tabText;
@property (strong,nonatomic)NSURL* cityUrl;


@end
