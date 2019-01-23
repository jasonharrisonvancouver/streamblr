//
//  Photograph.m
//  Streamblr
//
//  Created by jason harrison on 2019-01-23.
//  Copyright © 2019 jason harrison. All rights reserved.
//

#import "Photograph.h"

@implementation Photograph

- (instancetype)initWithImageName:(NSString *)imageName
                       andSubject:(NSString *)subject
                      andLocation:(NSString *)location
{
    self = [super init];
    if (self != nil) {
        _imageName = imageName;
        _subject = subject;
        _location = location;
    }
    return self;
}

@end
