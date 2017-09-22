//
//  ViewController.h
//  WeatherApp
//
//  Created by Vijay on 25/05/17.
//  Copyright © 2017 Neorays. All rights reserved.
//

#import <UIKit/UIKit.h>

//Creating protocol to receive data back from next Viewcontroller
@protocol ViewBProtocol
- (void)setData:(NSString *)data;
-(void)getcity:(NSMutableArray*)getcity;


@end


@interface ViewController : UIViewController<ViewBProtocol>


@property (nonatomic,weak) id<ViewBProtocol> delegate;



@property (strong,nonatomic) NSArray *PresentCondtn;
@property (strong, nonatomic)NSDictionary *json;
@property(strong, nonatomic)NSMutableArray *currentTemp;
@property(strong, nonatomic)NSMutableArray *sunriseTime;
@property(strong, nonatomic)NSMutableArray *lowtemperature;
@property(strong,nonatomic)NSMutableArray *farhTemperature;

@property(strong,nonatomic)NSMutableArray* cityNameWithoutDuplicates;


@property(strong,nonatomic)NSArray *zerothArray;
@property(strong,nonatomic)NSArray *firstArray;
@property(strong,nonatomic)NSArray *secondArray;
@property(strong, nonatomic)NSArray *transferArray;



@property(strong,nonatomic)NSNumber *number;
@property(strong, nonatomic)NSMutableArray *cityDetails;
@property(strong, nonatomic)NSMutableArray *cityTempDate;
//@property(strong, nonatomic)NSArray *transferArray;


@property(strong,nonatomic) NSString *urlString;


@property (weak, nonatomic) IBOutlet UILabel *sunRise;
@property (weak, nonatomic) IBOutlet UILabel *dateTimeNweek;
@property (weak, nonatomic) IBOutlet UILabel *sunSet;
@property (weak, nonatomic) IBOutlet UIImageView *WeatherImages;
@property (weak, nonatomic) IBOutlet UILabel *weatherLabel;
@property (weak, nonatomic) IBOutlet UILabel *tempInDegree;
@property (weak, nonatomic) IBOutlet UILabel *tempInFahrenheit;
@property (weak, nonatomic) IBOutlet UILabel *lowTempOutlet;
@property (weak, nonatomic) IBOutlet UILabel *highTempOutlet;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *location;

@property (weak, nonatomic) IBOutlet UIButton *zerothButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *firstButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *secondButtonOutlet;


- (IBAction)zerothButton:(UIButton *)sender;
- (IBAction)firstButton:(UIButton *)sender;
- (IBAction)secondButton:(UIButton *)sender;






@property (weak, nonatomic) IBOutlet UILabel *firstDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *secondDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *thirdDateLabel;


- (IBAction)leftDate:(UIButton *)sender;
- (IBAction)rightDate:(UIButton *)sender;




@end

