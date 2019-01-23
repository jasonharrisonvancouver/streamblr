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

@interface ImageViewController ()<UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *imageCollectionView;
@property (strong, nonatomic) UICollectionViewFlowLayout *imageLayout;
@property (strong, nonatomic) PhotographAlbumManager *albumManager;
@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.albumManager = [[PhotographAlbumManager alloc] init];
    self.imageCollectionView.dataSource = self;
    
    
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
    self.imageLayout = [[UICollectionViewFlowLayout alloc] init];
    
    self.imageLayout.itemSize = CGSizeMake(200, 200); // Set size of cell
    self.imageLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);  // "Border around each section"
    self.imageLayout.minimumInteritemSpacing = 15;  // Minimum horizontal spacing between cells
    self.imageLayout.minimumLineSpacing = 10;  // Minimum vertical spacing
    
    //    // Add this line so headers will appear. If this line is not present, headers will not appear
    //    self.simpleLayout.headerReferenceSize = CGSizeMake(self.collectionView.frame.size.width, 50);
    
    // By default, direction is vertical
    self.imageLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
    self.imageCollectionView.collectionViewLayout = self.imageLayout;
    // Add this line so headers will appear. If this line is not present, headers will not appear
//    self.imageLayout.headerReferenceSize = CGSizeMake(50, self.imageCollectionView.frame.size.height);
    
    // Add this line so footers will appear. If this line is not present, footers will not appear
  //  self.imageLayout.footerReferenceSize = CGSizeMake(30, self.imageCollectionView.frame.size.height);
}
- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSLog(@"this many items: %d", (int)[self.albumManager.album count]);
    return [self.albumManager.album count];
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

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView
                                   cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    ImageCollectionViewCell *cell = [self.imageCollectionView dequeueReusableCellWithReuseIdentifier:@"imageCell"
                                                                                        forIndexPath:indexPath];
    
        
    
    NSLog(@"image named %@", [self.albumManager.album[indexPath.row] imageName]);
    
    cell.imageView.image = [UIImage imageNamed:[self.albumManager.album[indexPath.row] imageName]];
    
    
    
    
    //cell.imageView.image =   [UIImage imageNamed:@"0"];
    
    [cell setBackgroundColor:UIColor.blueColor];
    return cell;
}









/*
 - (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
 viewForSupplementaryElementOfKind:(NSString *)kind
 atIndexPath:(NSIndexPath *)indexPath
 {
 if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
 MyHeaderView *headerView = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader
 withReuseIdentifier:@"MyHeaderView"
 forIndexPath:indexPath];
 headerView.label.text = [NSString stringWithFormat:@"%ld", (long)indexPath.section];
 return headerView;
 }
 else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
 MyFooterView *footerView = [self.collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter
 withReuseIdentifier:@"MyFooterView"
 forIndexPath:indexPath];
 footerView.label.text = [NSString stringWithFormat:@"%ld", (long)indexPath.section];
 return footerView;
 }
 else {
 return nil;
 }
 }
 */

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
