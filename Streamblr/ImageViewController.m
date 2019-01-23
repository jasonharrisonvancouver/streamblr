//
//  ViewController.m
//  Streamblr
//
//  Created by jason harrison on 2019-01-23.
//  Copyright © 2019 jason harrison. All rights reserved.
//

#import "ImageViewController.h"
#import "ImageCollectionViewCell.h"
#import "PhotographAlbumManager.h"
#import "ImageHeaderView.h"
#import "ImageFooterView.h"


@interface ImageViewController ()<UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *imageCollectionView;
@property (strong, nonatomic) UICollectionViewFlowLayout *imageLayout;
@property (strong, nonatomic) PhotographAlbumManager *albumManager;
//@property (weak, nonatomic) IBOutlet ImageHeaderView *imageHeaderView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *groupImagesSegmentedControl;


@property (nonatomic) BOOL sortBySubject; // NO means by location instead

@end

@implementation ImageViewController

- (IBAction)groupImagesSegementedControlValueChanged:(UISegmentedControl *)sender {
    if(sender.selectedSegmentIndex == 0){
     //   NSLog(@"going to sort by subject");
        self.sortBySubject = YES;
    }else{
    //    NSLog(@"going to sort by location");
        self.sortBySubject = NO;
    }
   
    [self.imageCollectionView reloadData];
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.albumManager = [[PhotographAlbumManager alloc] init];
    self.imageCollectionView.dataSource = self;
    self.sortBySubject = NO;
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    self.imageLayout = [[UICollectionViewFlowLayout alloc] init];
    
    self.imageLayout.itemSize = CGSizeMake(300, 300); // Set size of cell
    self.imageLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);  // "Border around each section"
    self.imageLayout.minimumInteritemSpacing = 15;  // Minimum horizontal spacing between cells
    self.imageLayout.minimumLineSpacing = 10;  // Minimum vertical spacing
    
    //    // Add this line so headers will appear. If this line is not present, headers will not appear
    //    self.simpleLayout.headerReferenceSize = CGSizeMake(self.collectionView.frame.size.width, 50);
    
    // By default, direction is vertical
    self.imageLayout.scrollDirection = UICollectionViewScrollDirectionVertical;//Horizontal;
    
    
    self.imageLayout.headerReferenceSize = CGSizeMake(200, 100);
    //self.imageCollectionView.frame.size.height);
    
    
    self.imageCollectionView.collectionViewLayout = self.imageLayout;
    // Add this line so headers will appear. If this line is not present, headers will not appear
    //    self.imageLayout.headerReferenceSize = CGSizeMake(50, self.imageCollectionView.frame.size.height);
    
    // Add this line so footers will appear. If this line is not present, footers will not appear
    //  self.imageLayout.footerReferenceSize = CGSizeMake(30, self.imageCollectionView.frame.size.height);
}
- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    // NSLog(@"this many items: %d", (int)[self.albumManager.album count]);
    
    
    /*
     - (Photograph *)getPhotographWithName:(NSString *)photographName;
     
     - (NSArray<NSString*>*)getAllSubjects;
     
     - (NSArray<Photograph*>*)getAllPhotographsWithSubject:(NSString *)subject;
     
     */
    
    if(self.sortBySubject == YES){
        
        NSArray<NSString *>*subjects = [self.albumManager getAllSubjects];
        
        for(int i = 0; i < [subjects count]; i++){
            if(i == section){
                
                // NSLog(@"%d photos with subject %@", (int) [[self.albumManager getAllPhotographsWithSubject:[subjects objectAtIndex:i]] count],
                
                //     [subjects objectAtIndex:i]
                //   );
                return [[self.albumManager getAllPhotographsWithSubject:[subjects objectAtIndex:i]] count];
            }
        }
        return [self.albumManager.album count];
        
    }else{
        NSArray<NSString *>*locations = [self.albumManager getAllLocations];
        
        for(int i = 0; i < [locations count]; i++){
            if(i == section){
                
                // NSLog(@"%d photos with subject %@", (int) [[self.albumManager getAllPhotographsWithSubject:[subjects objectAtIndex:i]] count],
                
                //     [subjects objectAtIndex:i]
                //   );
                return [[self.albumManager getAllPhotographsWithLocation:[locations objectAtIndex:i]] count];
            }
        }
        return [self.albumManager.album count];
    }
}

/*
 
 - (NSInteger)collectionView:(nonnull UICollectionView *)collectionView
 numberOfItemsInSection:(NSInteger)section
 {
 switch (section) {
 case 0:
 return 5;
 case 1:
 return 3;
 case 2:
 return 8;
 default:
 return 7;
 }
 }*/




- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    
    if(self.sortBySubject == YES){
    
        NSLog(@"number of subjects: %d", (int) [[self.albumManager getAllSubjects] count]);
        return [[self.albumManager getAllSubjects] count];
    }else{
        // location
        NSLog(@"number of locations: %d", (int) [[self.albumManager getAllLocations] count]);
        return [[self.albumManager getAllLocations] count];
    }
}








- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView
                                   cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    ImageCollectionViewCell *cell = [self.imageCollectionView dequeueReusableCellWithReuseIdentifier:@"imageCell"
                                                                                        forIndexPath:indexPath];
    
    
    /*
     
     - (Photograph *)getPhotographWithName:(NSString *)photographName;
     - (NSArray<NSString*>*)getAllSubjects;
     - (NSArray<Photograph*>*)getAllPhotographsWithSubject:(NSString *)subject;
     */
    /* section indicates the index in the array of subjects */
    /* row indicates the index in the array of photographs OF that subject */
    
    if(self.sortBySubject == YES){
        NSArray<NSString*>* allSubjects = [self.albumManager getAllSubjects];
        NSString *thisSubject = [allSubjects objectAtIndex:indexPath.section];
        
        NSArray<Photograph*>*allPhotographsWithThisSubject = [self.albumManager getAllPhotographsWithSubject:thisSubject];
        
        
        Photograph *thisPhotograph = [allPhotographsWithThisSubject objectAtIndex:indexPath.row];
        
        NSString *nameOfThisPhotograph = [thisPhotograph imageName];
        
        
        cell.imageView.image = [UIImage imageNamed:nameOfThisPhotograph];
    
    }else{
        NSArray<NSString*>* allLocations = [self.albumManager getAllLocations];
        NSString *thisLocation = [allLocations objectAtIndex:indexPath.section];
        
        NSArray<Photograph*>*allPhotographsWithThisLocation = [self.albumManager getAllPhotographsWithLocation:thisLocation];
        
        
        Photograph *thisPhotograph = [allPhotographsWithThisLocation objectAtIndex:indexPath.row];
        
        NSString *nameOfThisPhotograph = [thisPhotograph imageName];
        
        
        cell.imageView.image = [UIImage imageNamed:nameOfThisPhotograph];
        
    }
    
    
    
    
    //  NSLog(@"image named %@", [self.albumManager.album[indexPath.row] imageName]);
    
    //  cell.imageView.image = [UIImage imageNamed:[self.albumManager.album[indexPath.row] imageName]];
    
    
    
    
    //cell.imageView.image =   [UIImage imageNamed:@"0"];
    
    //[cell setBackgroundColor:UIColor.blueColor];
    return cell;
}










- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
           viewForSupplementaryElementOfKind:(NSString *)kind
                                 atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        ImageHeaderView *headerView = [self.imageCollectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                                                   withReuseIdentifier:@"imageHeaderView"
                                                                                          forIndexPath:indexPath];
        
        if(self.sortBySubject == YES){
        
        
            NSArray<NSString*>*subjects = [self.albumManager getAllSubjects];
            
            NSString *subject = [[NSString alloc] init];
            subject = [subjects objectAtIndex:[indexPath section]];
            NSLog(@"header for section %@", subject);
            
            
            headerView.headerLabel.text = [NSString stringWithFormat:@"Subject: %@", subject];
            return headerView;
        }else{
            // group by location
            NSArray<NSString*>*locations = [self.albumManager getAllLocations];
            
            NSString *location = [[NSString alloc] init];
            location = [locations objectAtIndex:[indexPath section]];
            NSLog(@"header for section %@", location);
            
            
            headerView.headerLabel.text = [NSString stringWithFormat:@"Location: %@", location];
            return headerView;
        }
    }/*
      else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
      ImageFooterView *footerView = [self.imageCollectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter
      withReuseIdentifier:@"imageFooterView"
      forIndexPath:indexPath];
      footerView.label.text = [NSString stringWithFormat:@"%ld", (long)indexPath.section];
      return footerView;
      }*/
    else {
        //NSLog(@"no");
        return nil;
    }
}


/* roland end */

















/*
 - (void)encodeWithCoder:(nonnull NSCoder *)aCoder {
 <#code#>
 }
 
 - (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
 <#code#>
 }
 
 - (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
 <#code#>
 }
 
 - (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
 <#code#>
 }
 
 - (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
 <#code#>
 }
 
 - (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
 <#code#>
 }
 
 - (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
 <#code#>
 }
 
 - (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
 <#code#>
 }
 
 - (void)setNeedsFocusUpdate {
 <#code#>
 }
 
 - (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
 <#code#>
 }
 
 - (void)updateFocusIfNeeded {
 <#code#>
 }
 */

@end
