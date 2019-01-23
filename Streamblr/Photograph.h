//
//  Photograph.h
//  Streamblr
//
//  Created by jason harrison on 2019-01-23.
//  Copyright © 2019 jason harrison. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Photograph : NSObject
@property (nonatomic, readwrite, strong)NSString *imageName;
@property (nonatomic, readwrite, strong)NSMutableArray<NSString *> *tags;
@property (nonatomic, readwrite, strong)NSString *subject;
@property (nonatomic, readwrite, strong)NSString *location;


- (instancetype)initWithImageName:(NSString *)imageName
                       andSubject:(NSString *)subject
                      andLocation:(NSString *)location;



@end

NS_ASSUME_NONNULL_END
