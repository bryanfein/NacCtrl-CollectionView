//
//  DAO.m
//  NavCtrl
//
//  Created by Aditya Narayan on 6/22/15.
//  Copyright (c) 2015 Aditya Narayan. All rights reserved.
//

#import "DAO.h"

@implementation DAO



+ (instancetype) sharedManager
{
    static dispatch_once_t once;
    static id sharedManager;
    dispatch_once(&once, ^
                  {
                      sharedManager = [[self alloc]init];
                  });
    return sharedManager;
}

-(void)companyAndProductInfo {
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:@"companyList"];
    
    if (encodedObject) {
        [self readData];
        return;
    }
    
    //APPLE PRODUCTS

    Products *ipad = [[Products alloc] initWithName:@"iPad" andImageName:@"Apple_logo.png" andURL:@"https://www.apple.com/ipad/"];
    Products *iPodTouch = [[Products alloc] initWithName:@"iPod Touch" andImageName:@"Apple_logo.png" andURL:@"https://www.apple.com/ipod-touch/"];
    Products *iPhone = [[Products alloc] initWithName:@"iPhone" andImageName:@"Apple_logo.png" andURL: @"https://www.apple.com/iphone/"];
    
    self.apple_products = [[NSMutableArray alloc] initWithObjects:ipad,iPodTouch,iPhone,nil];
    
    
    //SAMSUNG PRODUCTS
    
    Products *galaxyS4 = [[Products alloc] initWithName:@"Galaxy S4" andImageName:@"Samsung_Logo.png" andURL:@"http://www.samsung.com/global/microsite/galaxys4/"];
    Products *galaxyNote = [[Products alloc] initWithName:@"Galaxy Note" andImageName:@"Samsung_Logo.png" andURL:@"http://www.samsung.com/global/microsite/galaxynote/note/index.html?type=find"];
    Products *galaxyTab = [[Products alloc] initWithName:@"Galaxy Tab" andImageName:@"Samsung_Logo.png" andURL:@"http://www.samsung.com/us/topic/introducing-the-galaxy-tab-s/index.html?cid=ppc-&gclid=CjwKEAjwwN-rBRD-oMzT6aO_wGwSJABwEIkJWlLOBwKEElGzACzIkJmJhUTy_kr1Q8dHFGlMFcIE7xoCG1_w_wcB"];
    
    self.samsung_products =[[NSMutableArray alloc]initWithObjects: galaxyS4,galaxyNote,galaxyTab,nil];
    
    
    //HTC Products
    
    Products *oneM9 = [[Products alloc] initWithName:@"One M9" andImageName:@"htc logo 2.png" andURL:@"http://www.htc.com/us/smartphones/htc-one-m9/"];
    Products *oneM8 = [[Products alloc]initWithName:@"One M8" andImageName:@"htc logo 2.png" andURL:@"http://www.htc.com/us/smartphones/htc-one-m8/"];
    Products *oneE8 = [[Products alloc] initWithName:@"One E8" andImageName:@"htc logo 2.png" andURL:@"http://www.htc.com/us/smartphones/htc-one-e8/"];
    
    self.htc_products = [[NSMutableArray alloc] initWithObjects:oneM9,oneM8,oneE8,nil];
    
    //Motorola Product
    
    Products *motoG = [[Products alloc] initWithName:@"Moto G" andImageName:@"Motorola_Logo.png" andURL:@"http://www.motorola.com/us/smartphones/moto-g-2nd-gen/moto-g-2nd-gen.html"];
    Products *motoX = [[Products alloc] initWithName:@"Moto X" andImageName:@"Motorola_Logo.png" andURL:@"http://www.motorola.com/us/Moto-X/FLEXR1.html"];
    Products *droidMaxx = [[Products alloc] initWithName:@"Droid Maxx" andImageName:@"Motorola_Logo.png" andURL: @"https://www.motorola.com/us/smartphones/droid-maxx/m-droid-maxx.html"];
    
    self.motorola_products = [[NSMutableArray alloc] initWithObjects:motoG,motoX,droidMaxx,nil];
    
    
    Company *apple = [[Company alloc] initWithName:@"Apple mobile devices" andImageName: @"Apple_logo.png" andProducts: self.apple_products];
    Company *samsung = [[Company alloc] initWithName:@"Samsung mobile devices" andImageName:@"Samsung_Logo.png" andProducts: self.samsung_products];
    Company *htc = [[Company alloc] initWithName:@"HTC mobile devices" andImageName:@"htc logo 2.png" andProducts:self.htc_products];
    Company *motorola = [[Company alloc] initWithName:@"Motorola mobile devices" andImageName:@"Motorola_Logo.png" andProducts: self.motorola_products];
    
    self.companyList = [[NSMutableArray alloc] initWithObjects: apple,samsung,htc,motorola, nil];
    
        
        encodedObject = [NSKeyedArchiver archivedDataWithRootObject:self.companyList];
        [defaults setObject:encodedObject forKey:@"companyList"];
        [defaults synchronize];
        return;
        
    }
    


-(void) saveData {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:self.companyList];
    [defaults setObject:encodedObject forKey:@"companyList"];
    [defaults synchronize];
    NSLog(@"Data Saved");
}

-(void) readData {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *encodedObject = [defaults objectForKey:@"companyList"];
    self.companyList = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    NSLog(@"DATA READ");
}



@end
