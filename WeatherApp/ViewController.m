
//
//  ViewController.m
//  WeatherApp
//
//  Created by Vijay on 25/05/17.
//  Copyright © 2017 Neorays. All rights reserved.
//

#import "ViewController.h"
#import "SearchViewController.h"
@interface ViewController ()
@property NSString *getSearchCityName;
@end

@implementation ViewController{
    
     int buttonCount;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getLink:@"Bangalore"];
    
    
   
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}









#pragma mark - "Json Parsing"
-(void)getLink:(NSString*)navigationCity{
    
    
    self.urlString = [NSString stringWithFormat:@"http://api.worldweatheronline.com/premium/v1/weather.ashx?key=0e62a153f4af45caa7755451172505&q=%@&format=json&num_of_days=5",navigationCity];
    
    self.urlString = [self.urlString stringByReplacingOccurrencesOfString:@"" withString:@""];
    
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *datatask = [session dataTaskWithURL:[NSURL URLWithString:self.urlString] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    
        NSDictionary *json;
        if (data != nil) {
             json     = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            self.zerothArray = [[[json valueForKey:@"data"]valueForKey:@"weather"]objectAtIndex:0];
            self.firstArray = [[[json valueForKey:@"data"]valueForKey:@"weather"]objectAtIndex:1];
            self.secondArray = [[[json valueForKey:@"data"]valueForKey:@"weather"]objectAtIndex:2];
            
            
            
                   }
  
        NSLog(@"json data %@",json);

        dispatch_async(dispatch_get_main_queue(), ^{
           
            
            
            //WEATHER IMAGE
            NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://cdn.worldweatheronline.net/images/wsymbols01_png_64/wsymbol_0002_sunny_intervals.png"]];
            self.WeatherImages.image = [UIImage imageWithData:imageData];
            
            
            
            //WEATHER TITLE LABEL
            
            self.weatherLabel.text = [NSString stringWithFormat:@"%@",[[[[[[json valueForKey:@"data"]valueForKey:@"current_condition"]valueForKey:@"weatherDesc"]valueForKey:@"value"]objectAtIndex:0]objectAtIndex:0]];
            NSLog(@"weather title :%@",self.weatherLabel.text);
            
            
            
            //DATE
            self.dateTimeNweek.text = [[[[json valueForKey:@"data"]valueForKey:@"weather"]valueForKey:@"date"]objectAtIndex:0];
            NSLog(@"dateNtime: %@",_dateTimeNweek);
            
           
            //TEMPERATURE
            
            self.tempInDegree.text = [NSString stringWithFormat:@"+%@°C",[[[[json valueForKey:@"data"]valueForKey:@"current_condition"]valueForKey:@"temp_C"]objectAtIndex:0]];


            NSLog(@"temp is : %@",_tempInDegree.text);

          
            
            
            //FAHRENHEIT
           
            self.tempInFahrenheit.text = [NSString stringWithFormat:@"+%@°Fahrenheit",[[[[json valueForKey:@"data"]valueForKey:@"current_condition"]valueForKey:@"temp_F"]objectAtIndex:0]];
            
            NSLog(@"temp in fahrenheit %@",self.tempInFahrenheit);
            
            
            
            
            
            //SUNRISE TIME
            
            
          self.sunRise.text = [NSString stringWithFormat:@"%@",[[[[[[json valueForKey:@"data" ] valueForKey:@"weather"] valueForKey:@"astronomy"] valueForKey:@"sunrise"]  objectAtIndex:0] objectAtIndex:0]];
            
            NSLog(@"sunrise timing is %@",_sunRise.text);
            
            
            
            
            
            //SUNSET TIME
            
            self.sunSet.text = [[[[[[json valueForKey:@"data"]valueForKey:@"weather"]valueForKey:@"astronomy"]valueForKey:@"sunset"]objectAtIndex:0]objectAtIndex:0];
            
           NSLog(@"sunset timing is : %@", _sunSet);
            

            
            
            //SET CITYNAME
            self.navigationItem.title = [[[[json valueForKey:@"data"]valueForKey:@"request"] valueForKey:@"query"] objectAtIndex:0];
            
            NSLog(@"%@ cityName",self.navigationItem.title);
            
            
            
            
            
            
            //MINIMUM TEMP

            
            self.lowTempOutlet.text = [NSString stringWithFormat:@"Lowest %@°C",[[[[json valueForKey:@"data"]valueForKey:@"weather"]valueForKey:@"mintempC"]objectAtIndex:0]];
            
            NSLog(@"minimum temp is : %@",self.lowTempOutlet.text);
            
            
          
            
            //MAXIMUM TEMP
            
            
            self.highTempOutlet.text = [NSString stringWithFormat:@"Highest %@°C",[[[[json valueForKey:@"data"]valueForKey:@"weather"]valueForKey:@"maxtempC"]objectAtIndex:0]];
            
            NSLog(@"maximum temp is : %@",self.highTempOutlet.text);
            
       
   // self.zerothArray = ;
        NSLog(@"zeroth date is %@",_zerothArray);
    self.firstDateLabel.text = [[[[json valueForKey:@"data"]valueForKey:@"weather"]valueForKey:@"date"]objectAtIndex:0];
            
            
            
            
  //  self.firstArray = ;
            NSLog(@"second date is %@",_firstArray);
            
    self.secondDateLabel.text = [[[[json valueForKey:@"data"] valueForKey:@"weather"]valueForKey:@"date"]objectAtIndex:1];
        
            
            
            
            
    //self.secondArray = ;
            NSLog(@"third date is %@", _secondArray);
            
    self.thirdDateLabel.text = [[[[json valueForKey:@"data"]valueForKey:@"weather"]valueForKey:@"date"]objectAtIndex:2];

          [self dateFormatter:0 :self.firstDateLabel.text];
          [self dateFormatter:1 :self.secondDateLabel.text];
          [self dateFormatter:2 :self.thirdDateLabel.text];
            
            
            
            
            
            
            //ZEROTH BUTTON
            NSArray *tempC = [[[[json valueForKey:@"data"]valueForKey:@"weather"]valueForKey:@"maxtempC"]objectAtIndex:0];
            
            [self.zerothButtonOutlet setTitle:[NSString stringWithFormat:@"+%@°C",tempC] forState:UIControlStateNormal];
    
            NSLog(@"0th button tempC is :%@", self.zerothButtonOutlet);
            
            
            
            
            //FIRST BUTTON
            NSArray *tempCC = [[[[json valueForKey:@"data"]valueForKey:@"weather"]valueForKey:@"maxtempC"]objectAtIndex:1];
            
            [self.firstButtonOutlet setTitle:[NSString stringWithFormat:@"+%@°C",tempCC] forState:UIControlStateNormal];
           
            NSLog(@"1st button tempCC is:%@",_firstButtonOutlet);
            

            
            //SECOND BUTTON
            NSArray *tempCCC = [[[[json valueForKey:@"data"]valueForKey:@"weather"]valueForKey:@"maxtempC"]objectAtIndex:2];
            //NSLog(@"temp CCC is :%@",tempCCC);

            [self.secondButtonOutlet setTitle:[NSString stringWithFormat:@"+%@°C",tempCCC] forState:UIControlStateNormal];
            NSLog(@"temp CCC is :%@",_secondButtonOutlet);
            
        });
    }];
    
    
    [datatask resume];
}






-(void)getcity:(NSMutableArray*)getcity{
    
    self.cityNameWithoutDuplicates =[[self.cityNameWithoutDuplicates arrayByAddingObjectsFromArray:getcity]mutableCopy];
    NSSet *uniqueCities = [NSSet setWithArray:self.cityNameWithoutDuplicates];
    
    self.cityNameWithoutDuplicates = [NSMutableArray arrayWithArray:[uniqueCities allObjects]];
}




//CREATES  DELEGATES
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
        
    UIViewController *controller = [segue destinationViewController];
    if ([controller isKindOfClass:[SearchViewController class]]) {
        SearchViewController *searchcontroller = (SearchViewController*)controller;
        searchcontroller.delegate = self;
    
        searchcontroller.delegate = self;
        
    }
    
}


-(void)setData:(NSString *)data{
    [self getSession:data];
self.navigationItem.title=data;
    
}
     
-(void)getSession : (NSString *)jsonUrl{
  
      [self getLink:jsonUrl];
    self.getSearchCityName=jsonUrl;
    
   
}
-(void)viewWillAppear:(BOOL)animated{
    
    self.navigationItem.title=self.getSearchCityName;

    
}

-(void)dateFormatter : (int)buttonNumber : (NSString *)dateStr{

    NSString *myString = dateStr;
   
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
  
    NSDate *myDate = [dateFormatter dateFromString:myString];
    dateFormatter.dateFormat = @"EEE, MMM d";
  
    NSLog(@"%@",[dateFormatter stringFromDate:myDate]);
    
    switch (buttonNumber) {
        case 0:
            self.firstDateLabel.text = [ NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:myDate] ];
            break;
        case 1:
            self.secondDateLabel.text = [ NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:myDate] ];
            break;
        case 2:
            self.thirdDateLabel.text = [ NSString stringWithFormat:@"%@",[dateFormatter stringFromDate:myDate] ];
            break;
            
        default:
            break;
    }
}



    
    


-(void)updateButton :(NSArray*)dateArray{
    
    self.sunSet.text = [[[dateArray valueForKey:@"astronomy"] valueForKey:@"sunset"] objectAtIndex:0];
    
    self.sunRise.text = [[[dateArray valueForKey:@"astronomy"] valueForKey:@"sunrise"] objectAtIndex:0];
    
    
    self.dateTimeNweek.text = [dateArray valueForKey:@"date"];
    
    
    self.tempInDegree.text = [NSString stringWithFormat:@"+%@°C",[dateArray valueForKey:@"maxtempC"]];
    
    
    self.tempInFahrenheit.text =[NSString stringWithFormat:@"+%@°F",[dateArray valueForKey:@"maxtempF" ]];
    
    self.lowTempOutlet.text = [NSString stringWithFormat:@"+%@°C",[dateArray valueForKey:@"mintempC" ]];
    
    self.highTempOutlet.text = [NSString stringWithFormat:@"+%@°C",[dateArray valueForKey:@"maxtempC"]];
    
    self.weatherLabel.text = [[[[[dateArray valueForKey:@"hourly"] valueForKey:@"weatherDesc"] valueForKey:@"value"]objectAtIndex:0] objectAtIndex:0];
    NSLog(@" weatherLabel is : %@", _weatherLabel.text);
    
    
    
 
    self.WeatherImages.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[[[[dateArray valueForKey:@"hourly" ] valueForKey:@"weatherIconUrl"] valueForKey:@"value"] objectAtIndex:0] objectAtIndex:0]]]];
    
    
    
    }



- (IBAction)zerothButton:(UIButton *)sender {
    
    [self updateButton:self.zerothArray];
    
    
}

- (IBAction)firstButton:(UIButton *)sender {
    
    [self updateButton:self.firstArray];
    
}

- (IBAction)secondButton:(UIButton *)sender {
    [self updateButton:self.secondArray];
}


- (IBAction)leftDate:(UIButton *)sender {
    buttonCount--;
    
    switch (buttonCount) {
        case 0:
            [self updateButton:self.zerothArray];
            break;
            
        case 1:
            [self updateButton:self.firstArray];
            break;
            
        case 2:
            [self updateButton:self.secondArray];
            break;

            
        default:
            buttonCount++;
            break;
    }
    
        
    }

- (IBAction)rightDate:(UIButton *)sender {
    
    buttonCount++;
    
    switch (buttonCount) {
        case 0:
            [self updateButton: self.zerothArray];
            break;
            
        case 1:
            [self updateButton:self.firstArray];
            break;
            
        case 2:
            [self updateButton:self.secondArray];
            break;
        default:
            
            buttonCount--;
            break;
    }
    
}


@end
