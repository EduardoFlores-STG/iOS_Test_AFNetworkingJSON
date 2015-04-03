//
//  ViewController.m
//  Test_AFNetworkingJSON
//
//  Created by Eduardo Flores on 4/3/15.
//  Copyright (c) 2015 Eduardo Flores. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking.h"

#define WEATHER_URL_JSON        @"http://www.raywenderlich.com/demos/weather_sample/weather.php?format=json"

// AFNetworking official Usage Guide: https://github.com/AFNetworking/AFNetworking#usage

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)button_basicHTTPcall:(id)sender
{
    NSURL *url = [NSURL URLWithString:WEATHER_URL_JSON];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    operation.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         NSLog(@"responseObject = %@", responseObject);
         NSLog(@"responseObject is class = %@", [responseObject class]);
         
     } failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         NSLog(@"failed to get the JSON string!. Error = %@", error);
     }];
    
    [operation start];
}

- (IBAction)button_GETcall:(id)sender
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:WEATHER_URL_JSON
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject)
            {
                NSLog(@"response = %@", responseObject);
            }
         failure:^(AFHTTPRequestOperation *operation, NSError *error)
            {
                NSLog(@"failure = %@", error);
            }];
}

- (IBAction)button_POSTcall:(id)sender
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSDictionary *params = @{@"someKey" : @"someValue"};

    [manager POST:WEATHER_URL_JSON
       parameters:params
          success:^(AFHTTPRequestOperation *operation, id responseObject)
            {
                NSLog(@"response = %@", responseObject);
            }
          failure:^(AFHTTPRequestOperation *operation, NSError *error)
            {
                NSLog(@"POST failure = %@", error);
            }];
}
@end


















































