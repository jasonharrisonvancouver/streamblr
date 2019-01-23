//
//  PhotographAlbumManager.h
//  Streamblr
//
//  Created by jason harrison on 2019-01-23.
//  Copyright © 2019 jason harrison. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Photograph.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhotographAlbumManager : NSObject
@property (nonatomic, strong, readwrite)NSMutableArray<Photograph *>*album;




- (Photograph *)getPhotographWithName:(NSString *)photographName;

- (NSArray<NSString*>*)getAllSubjects;

- (NSArray<Photograph*>*)getAllPhotographsWithSubject:(NSString *)subject;



- (NSArray<NSString*>*)getAllLocations;

- (NSArray<Photograph*>*)getAllPhotographsWithLocation:(NSString *)location;

@end

NS_ASSUME_NONNULL_END
