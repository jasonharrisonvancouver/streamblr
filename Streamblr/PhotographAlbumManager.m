//
//  PhotographAlbumManager.m
//  Streamblr
//
//  Created by jason harrison on 2019-01-23.
//  Copyright © 2019 jason harrison. All rights reserved.
//

#import "PhotographAlbumManager.h"

@implementation PhotographAlbumManager


- (Photograph *)getPhotographWithName:(NSString *)photographName{
    
    for (Photograph *photograph in self.album) {
        if([[photograph imageName] isEqualToString:[NSString stringWithFormat:@"%@", photographName]]){
            return photograph;
        }
    }
    return nil;
    
}



- (NSArray<Photograph*>*)getAllPhotographsWithSubject:(NSString *)subject{
    NSMutableArray<Photograph*>*photographs = [[NSMutableArray<Photograph*> alloc] init];
    
    for (Photograph *photograph in self.album) {
        
        if ([[photograph subject] isEqualToString:subject]) {
            [photographs addObject:photograph];
            //NSLog(@"new subject: %@", [photograph subject]);
        }else{
            //NSLog(@"duplicate subject: %@", [photograph subject]);
        }
    }
    return (NSArray *)photographs;
}



- (NSArray<NSString*>*)getAllSubjects{
    NSMutableArray<NSString*>*subjects = [[NSMutableArray<NSString*> alloc] init];
    
    for (Photograph *photograph in self.album) {
        
        if (![subjects containsObject:[photograph subject]]) {
            [subjects addObject:[photograph subject]];
            //NSLog(@"new subject: %@", [photograph subject]);
        }else{
            //NSLog(@"duplicate subject: %@", [photograph subject]);
        }
    }
    return (NSArray *)subjects;
}

- (void)addAllImagesToAlbum{
    Photograph *p0 = [[Photograph alloc] initWithImageName:@"0" andSubject:@"cassandra" andLocation:@"bar"];
    
    NSMutableArray<NSString *>*tags0 = [[NSMutableArray<NSString *> alloc] initWithArray:@[[p0 subject], [p0 location], @"cuba", @"drink"]];
    [p0 setTags:tags0];
    
    Photograph *p1 = [[Photograph alloc] initWithImageName:@"1" andSubject:@"cassandra" andLocation:@"beach"];
 
    NSMutableArray<NSString *>*tags1 = [[NSMutableArray<NSString *> alloc] initWithArray:@[[p1 subject], [p1 location], @"cuba", @"jason", @"hair"]];
    [p1 setTags:tags1];
    
    Photograph *p2 = [[Photograph alloc] initWithImageName:@"2" andSubject:@"cassandra" andLocation:@"beach"];
    
    NSMutableArray<NSString *>*tags2 = [[NSMutableArray<NSString *> alloc] initWithArray:@[[p2 subject], [p2 location], @"cuba", @"water", @"ocean", @"feet", @"legs"]];
    [p2 setTags:tags2];
    
    Photograph *p3 = [[Photograph alloc] initWithImageName:@"3" andSubject:@"jason" andLocation:@"beach"];
    
    NSMutableArray<NSString *>*tags3 = [[NSMutableArray<NSString *> alloc] initWithArray:@[[p3 subject], [p3 location], @"cuba", @"water", @"ocean", @"calm", @"sitting"]];
    [p3 setTags:tags3];
    
    Photograph *p4 = [[Photograph alloc] initWithImageName:@"4" andSubject:@"cassandra" andLocation:@"bar"];
    
    NSMutableArray<NSString *>*tags4 = [[NSMutableArray<NSString *> alloc] initWithArray:@[[p4 subject], [p4 location], @"cuba", @"pina colada", @"sunglasses", @"drinks"]];
    [p4 setTags:tags4];
    
    Photograph *p5 = [[Photograph alloc] initWithImageName:@"5" andSubject:@"car" andLocation:@"bar"];
    
    
    NSMutableArray<NSString *>*tags5 = [[NSMutableArray<NSString *> alloc] initWithArray:@[[p5 subject], [p5 location], @"cuba", @"wagon wheel", @"chevy", @"car"]];
    [p5 setTags:tags5];
    
    Photograph *p6 = [[Photograph alloc] initWithImageName:@"6" andSubject:@"lizard" andLocation:@"rock"];
    
    NSMutableArray<NSString *>*tags6 = [[NSMutableArray<NSString *> alloc] initWithArray:@[[p6 subject], [p6 location], @"cuba"]];
    [p6 setTags:tags6];
    
    
    Photograph *p7 = [[Photograph alloc] initWithImageName:@"7" andSubject:@"cassandra" andLocation:@"beach"];
    
    NSMutableArray<NSString *>*tags7 = [[NSMutableArray<NSString *> alloc] initWithArray:@[[p7 subject], [p7 location], @"cuba", @"yoga", @"peace", @"calm", @"path", @"trail"]];
    [p7 setTags:tags7];
    
    
    Photograph *p8 = [[Photograph alloc] initWithImageName:@"8" andSubject:@"ocean" andLocation:@"beach"];
    
    NSMutableArray<NSString *>*tags8 = [[NSMutableArray<NSString *> alloc] initWithArray:@[[p8 subject], [p8 location], @"cuba", @"sky", @"vista", @"landscape", @"wallpaper"]];
    [p8 setTags:tags8];
    
    
    Photograph *p9 = [[Photograph alloc] initWithImageName:@"9" andSubject:@"sailboat" andLocation:@"ocean"];
    
    
    NSMutableArray<NSString *>*tags9 = [[NSMutableArray<NSString *> alloc] initWithArray:@[[p9 subject], [p9 location], @"cuba", @"peace", @"wallpaper", @"landscape"]];
    [p9 setTags:tags9];
    
    Photograph *p10 = [[Photograph alloc] initWithImageName:@"10" andSubject:@"clam" andLocation:@"beach"];
    
    NSMutableArray<NSString *>*tags10 = [[NSMutableArray<NSString *> alloc] initWithArray:@[[p10 subject], [p10 location], @"cuba", @"clamshell", @"ocean", @"hand"]];
    [p10 setTags:tags10];
    
    Photograph *p11 = [[Photograph alloc] initWithImageName:@"11" andSubject:@"jason" andLocation:@"beach"];
    
    NSMutableArray<NSString *>*tags11 = [[NSMutableArray<NSString *> alloc] initWithArray:@[[p11 subject], [p11 location], @"cuba", @"book", @"reading", @"feet"]];
    [p11 setTags:tags11];
    
    Photograph *p12 = [[Photograph alloc] initWithImageName:@"12" andSubject:@"palm trees" andLocation:@"resort"];
    
    NSMutableArray<NSString *>*tags12 = [[NSMutableArray<NSString *> alloc] initWithArray:@[[p12 subject], [p12 location], @"cuba", @"tree", @"sky"]];
    [p12 setTags:tags12];
    
    Photograph *p13 = [[Photograph alloc] initWithImageName:@"13" andSubject:@"cassandra" andLocation:@"dolphinarium"];
    
    NSMutableArray<NSString *>*tags13 = [[NSMutableArray<NSString *> alloc] initWithArray:@[[p13 subject], [p13 location], @"cuba", @"swim", @"dolphin", @"water", @"ocean"]];
    [p13 setTags:tags13];
    
    Photograph *p14 = [[Photograph alloc] initWithImageName:@"14" andSubject:@"cassandra" andLocation:@"dolphinarium"];
    
    NSMutableArray<NSString *>*tags14 = [[NSMutableArray<NSString *> alloc] initWithArray:@[[p14 subject], [p14 location], @"cuba", @"swim", @"dolphin", @"water", @"ocean"]];
    [p14 setTags:tags14];
    
    Photograph *p15 = [[Photograph alloc] initWithImageName:@"15" andSubject:@"jason" andLocation:@"dolphinarium"];
    
    NSMutableArray<NSString *>*tags15 = [[NSMutableArray<NSString *> alloc] initWithArray:@[[p15 subject], [p15 location], @"cuba", @"swim", @"dolphin", @"water", @"ocean"]];
    [p15 setTags:tags15];
    
    Photograph *p16 = [[Photograph alloc] initWithImageName:@"16" andSubject:@"sandals" andLocation:@"resort"];
    
    NSMutableArray<NSString *>*tags16 = [[NSMutableArray<NSString *> alloc] initWithArray:@[[p16 subject], [p16 location], @"cuba", @"sandal", @"feet", @"sand"]];
    [p16 setTags:tags16];
    
    [self.album addObject:p0];
    [self.album addObject:p1];
    [self.album addObject:p2];
    [self.album addObject:p3];
    [self.album addObject:p4];
    [self.album addObject:p5];
    [self.album addObject:p6];
    [self.album addObject:p7];
    [self.album addObject:p8];
    [self.album addObject:p9];
    [self.album addObject:p10];
    [self.album addObject:p11];
    [self.album addObject:p12];
    [self.album addObject:p13];
    [self.album addObject:p14];
    [self.album addObject:p15];
    [self.album addObject:p16];
    
}

- (instancetype)init
{
    self = [super init];
    if (self != nil) {
        _album = [[NSMutableArray<Photograph *>alloc] init];
        [self addAllImagesToAlbum];
    }
    return self;
}




@end
