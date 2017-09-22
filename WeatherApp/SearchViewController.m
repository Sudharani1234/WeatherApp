 //
//  SearchViewController.m
//  WeatherApp
//
//  Created by Vijay on 30/05/17.
//  Copyright © 2017 Neorays. All rights reserved.
//

#import "SearchViewController.h"
#import "ViewController.h"
@interface SearchViewController ()
{
    //NSString *tabText;

}

@end

@implementation SearchViewController

- (void)viewDidLoad {
    
    
    [super viewDidLoad];
  
    self.activity.hidden = YES;
    
    

    self.url = [[NSString alloc] init];
    self.cityNames = [[NSMutableArray alloc]init];
    //self.cityCountry = [[NSMutableArray alloc]init];
    
    self.searchLocation.placeholder = @"Search";
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getLinkData : (NSString *)cityEndPoint{
    
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://api.worldweatheronline.com/premium/v1/search.ashx?key=4f0a887752b84dbcadf42647170505&q=%@&format=json",cityEndPoint]];
    
    
    
          // GET JSON
         NSURLSessionDataTask *datatask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
             
//             if (data == [NSNull null]) {
//                 
//             }
             NSDictionary *json;
             if (data != nil) {
                 json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
             }
             
        
        
        NSLog(@"json data %@",json);
        
//             if (json==json) {
//                 nil;
//             }
             
        //GET CITY NAMES
          self.cityArray = [[[json objectForKey:@"search_api"] valueForKey:@"result"] valueForKey:@"areaName"];
        NSLog(@"searching CityNames :%@",self.cityArray);
             [self.cityNames removeAllObjects];
             
             for (NSDictionary *obj in _cityArray) {
                 for (NSString *city in [obj valueForKey:@"value"]) {
                
                     [self.cityNames addObject:city];
                     
                     
                     
                 }
             }
             
             
    
             NSLog(@"city names as String %@",self.cityNames);
            // [_tableViewOutlet reloadData];
             dispatch_async(dispatch_get_main_queue(), ^{
                 [self.tableViewOutlet reloadData];
             });
         }];
   //
    
    [datatask resume];
    
    self.activity.hidden = YES;
    [self.activity stopAnimating];
   // [self searchTableList];
    
    
   }





-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cityNames.count;
    

}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.textLabel.text = [self.cityNames objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = nil;
   
   // tabText = cell.textLabel.text;
    
    
   // self.navigationItem.title = cell.textLabel.text;
    //NSString *tabText = self.navigationItem.title;
    return cell;
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.navigationController popViewControllerAnimated:YES];
    

    //Sends Selected tableView index to previous view controller
    [self.delegate getcity:self.cityNames];
    [self.delegate setData:[self.cityNames objectAtIndex:indexPath.row]];
    
    
   }



//Calls the delegate method to send data
-(void)setData:(NSString*)data
{
    [self.delegate setData:data];
}





- (IBAction)searchButton:(UIButton *)sender {
    
    // [self.searchLocation resignFirstResponder];
    
    [self getLinkData:self.searchLocation.text];
    [self.activity startAnimating];
    
    
    
}




-(void)textFieldDidEndEditing:(UITextField *)textField{
    
//    self.searchLocation.text = self.searchButton;
    [textField resignFirstResponder];
}






-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    return YES;
}


@end
